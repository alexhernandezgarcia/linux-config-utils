## Install

```
sudo apt install qrencode
```

## use

```
qrencode -s 6 -l H -o "qrcode.png" "https://arxiv.org/abs/2310.04925"
```

- `-s 6`: size of the blocks in the QR checkered pattern
- `-l H`: level of error-correction (L, M or H)
- `-o "output.png"`: output file

## References

- [How to Create QR Codes From the Linux Command Line](https://www.howtogeek.com/devops/how-to-create-qr-codes-from-the-linux-command-line/)
