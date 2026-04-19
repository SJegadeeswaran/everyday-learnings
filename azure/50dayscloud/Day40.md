**Day 40: Managing Secrets with Azure Key Vault**

    The Nautilus DevOps team is focusing on improving their data security by using Azure Key Vault. Your task is to create a Key Vault with an RSA key and manage the encryption and decryption of a pre-existing sensitive file using this key.

Specific Requirements:

    Create a Key Vault:
        Name the Key Vault xfusion-14368.
        Create the vault in the East US region.
        Use the Standard pricing tier.
        Set Soft Delete retention to 7 days.
        Use the Vault access policy permission model.
        Configure an access policy that allows Get, List, Encrypt, and Decrypt permissions for the lab identity.

    Create an RSA Key:
        Create a key named xfusion-key within the Key Vault.
        Key type: RSA.
        RSA key size: 4096.
        Leave all other settings as default.

    Encrypt the Sensitive Data:
        Use the key to encrypt the provided SensitiveData.txt file (located in /root/) on the azure-client host.
        Use the RSA-OAEP algorithm.
        Base64 encode the plaintext before encryption.
        Save the encrypted version as EncryptedData.bin in the /root/ directory.

    Note: If you encounter a permissions error, retrieve the Service Principal ID using:
    az account show --query user.name -o tsv
    and grant the required Key Vault permissions.

    Verify Decryption:
        Decrypt EncryptedData.bin.
        Base64 decode the decrypted output.
        Save the result as DecryptedData.txt in /root/.
        Ensure the decrypted file matches the original SensitiveData.txt.

Ensure that the Key Vault and key are correctly configured. The validation script will test your configuration by decrypting the EncryptedData.bin file using the key you created.

Notes:

    Create the resources only in the East US region.
    Network restrictions or private endpoints are NOT required for this task.

**Solution**

* Search for key vault-->Click create
* Enter the vault name, region, pricing tier and days to retain
* Click next and on the access configuration-->permission model-->Choose vault access policy
* Under access policies-->Choose existing policy
* Click Create and choose permissions as Get, list, create, encrypt and decrypt for all and then choose the app id.
* To know the app id enter: az account show --query user.name -o tsv
* Enter the following command to create RSA key in the key vault:

```
az keyvault key create --vault-name "xfusion-14368" --name "xfusion-key" --protection software --kty RSA --size 4096
```

* Go to the created xfusion-key from azure portal and click the download public key option.
* The file will be downloaded as a pem file.

Encrypt and Base64 Encode (Linux/macOS):
bash

echo -n "MySecretData" | openssl pkeyutl -encrypt -pubin -inkey pubkey.pem -pkeyopt rsa_padding_mode:oaep -pkeyopt rsa_oaep_md:sha256 | base64

    -pkeyopt rsa_padding_mode:oaep: Specifies the RSA-OAEP padding.
    -pkeyopt rsa_oaep_md:sha256: Sets SHA-256 for the hash algorithm.
    | base64: Encodes the raw binary encryption output into a Base64 string.
    
    
Decrypt and Decode (Linux/macOS):
bash

echo "Base64EncodedString" | base64 -d | \
openssl pkeyutl -decrypt -inkey private.pem \
-pkeyopt rsa_padding_mode:oaep \
-pkeyopt rsa_oaep_md:sha256

**Error**

============================= test session starts ==============================
platform linux -- Python 3.10.15, pytest-8.3.4, pluggy-1.5.0
rootdir: /usr/share
plugins: testinfra-10.1.1
collected 1 item

../usr/share/test.py F                                                   [100%]

=================================== FAILURES ===================================
_________________________ test_key_vault_configuration _________________________

    def test_key_vault_configuration():
        host = testinfra.get_host("local://")

        # Step 1: Verify Key Vault and Key exist
        key_vault_name = 'xfusion-14368'
        key_name = 'xfusion-key'

        # Check if Key Vault exists
        key_vault_check = host.run(f"az keyvault show --name {key_vault_name} --query 'name' -o tsv")
        assert key_vault_check.rc == 0, f"Key Vault '{key_vault_name}' not found."

        # Check if Key exists in the Key Vault
        key_check = host.run(f"az keyvault key show --vault-name {key_vault_name} --name {key_name} --query 'key.kid' -o tsv")
        assert key_check.rc == 0, f"Key '{key_name}' not found in Key Vault '{key_vault_name}'."

        # Step 2: Perform decryption using the Key Vault key and verify that decryption is successful
        encrypted_file = "/root/EncryptedData.bin"
        decrypted_file = "/tmp/DecryptedData.txt"

        # Check if the encrypted file exists
        file = host.file(encrypted_file)
        assert file.exists, f"File '{encrypted_file}' doesn't exist; it seems you didn't encrypt the '/root/SensitiveData.txt' file."

        # Read the encrypted file content as binary
        with open(encrypted_file, "rb") as f:
            encrypted_data = f.read()

        # Define RSA-4096 modulus limit (512 bytes max)
        RSA_MAX_LENGTH = 512

        # Check if encrypted data exceeds RSA limit
        if len(encrypted_data) > RSA_MAX_LENGTH:
            print("Encrypted data exceeds RSA limit. Assuming it's base64-encoded and decoding first.")
>           encrypted_data = base64.b64decode(encrypted_data)

/usr/share/test.py:38: 
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 

s = b'Oq9XjWF4XSxgVh9dKz1a4EMDJV71HdCktYf2CuI4pCAHW6za1Ufqm9Mi0+1GrtaTrBAfilcOc3a6gGPsXKtF0IqR0ES5DZeoNmDFttIfqz0iWSkDTdOZ...0Ws/+TquCFbKe8b6x/Q2Hg/feghQ/16V7/CzPc7V3Mgx3GHCm5a9esSN3392z09SHmOXJWqKkIo1TxkO6rv0DxmrJbWLyG+hJJhACvhzjwjvB0kaep0=\n'
altchars = None, validate = False

    def b64decode(s, altchars=None, validate=False):
        """Decode the Base64 encoded bytes-like object or ASCII string s.

        Optional altchars must be a bytes-like object or ASCII string of length 2
        which specifies the alternative alphabet used instead of the '+' and '/'
        characters.

        The result is returned as a bytes object.  A binascii.Error is raised if
        s is incorrectly padded.

        If validate is False (the default), characters that are neither in the
        normal base-64 alphabet nor the alternative alphabet are discarded prior
        to the padding check.  If validate is True, these non-alphabet characters
        in the input result in a binascii.Error.
        """
        s = _bytes_from_decode_data(s)
        if altchars is not None:
            altchars = _bytes_from_decode_data(altchars)
            assert len(altchars) == 2, repr(altchars)
            s = s.translate(bytes.maketrans(altchars, b'+/'))
        if validate and not re.fullmatch(b'[A-Za-z0-9+/]*={0,2}', s):
            raise binascii.Error('Non-base64 digit found')
>       return binascii.a2b_base64(s)
E       binascii.Error: Invalid base64-encoded string: number of data characters (677) cannot be 1 more than a multiple of 4

/usr/local/lib/python3.10/base64.py:87: Error
----------------------------- Captured stdout call -----------------------------
Encrypted data exceeds RSA limit. Assuming it's base64-encoded and decoding first.
=========================== short test summary info ============================
FAILED ../usr/share/test.py::test_key_vault_configuration - binascii.Error: I...
============================== 1 failed in 5.79s ===============================