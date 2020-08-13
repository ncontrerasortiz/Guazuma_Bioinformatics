# Connecting to HPC using a keypair
To work remotely

### Creating the key pair

`~$ ssh-keygen -t ed25519
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/naco/.ssh/id_ed25519): 
Enter passphrase (empty for no passphrase): nataliacon1
Enter same passphrase again: 
Your identification has been saved in /home/naco/.ssh/id_ed25519.
Your public key has been saved in /home/naco/.ssh/id_ed25519.pub.
The key fingerprint is:
SHA256:qGbhiMgCnUBjF+SR8w9ruF6LN2ODBWCHyhRdwkTJQ0c naco@naco-ThinkPad-L390-Yoga
The key's randomart image is:
+--[ED25519 256]--+
| =@X*E           |
|o=+X+            |
|* o.+            |
|.+ o o .         |
|. o + = S        |
|+. + * .         |
|+.. X.           |
|.  =o*.          |
|  .oo.+          |
+----[SHA256]-----+
`

- The keypair will be written to `~/.ssh/` and consists of two files: the private key file and the public key-file:
		- `~/.ssh/id_ed25519`
		- `~/.ssh/id_ed25519.pub` : ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILYRWZC6CHt9nBCOcgb9lr0zGp7pK1VSEKDCXoa6AaRF 