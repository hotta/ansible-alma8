# How to build

- [CentOS7 PostfixのSMTP認証](https://www.unix-power.net/networking/post-698)

# saslauthd simple test

```bash
$ testsaslauthd -u smtpuser -p smtppass
```

# Normal SMTP test

```bash
$ echo hello via plain SMTP | mailx smtpuser@example.com
$ sudo tail -3 /var/log/maillog
Oct 30 16:08:44 psmon-php5 postfix/qmgr[17892]: 0765F352D0: from=<vagrant@example.com>, size=409, nrcpt=1 (queue active)
Oct 30 16:08:44 psmon-php5 postfix/local[18038]: 0765F352D0: to=<smtpuser@example.com>, relay=local, delay=0.03, delays=0.02/0.01/0/0, dsn=2.0.0, status=sent (delivered to maildir)
Oct 30 16:08:44 psmon-php5 postfix/qmgr[17892]: 0765F352D0: removed
```

# Confirm mailbox(expect string that we previously specified by echo)

```bash
$ sudo ls ~smtpuser/Maildir/new
(HASH).mail-trap
$ sudo tail -1 ~smtpuser/Maildir/new/(HASH).mail-trap
hello via plain SMTP
```

# SMTP Auth test

```bash
$ echo hello via SMTP Auth | mailx \
  -S smtp=smtp://localhost:587  \
  -S smtp-auth-user=smtpuser  \
  -S smtp-auth-password=smtppass  \
  smtpuser@example.com
```

# Confirm reception

```bash
$ sudo su - smtpuser
$ mailx -f ~/Maildir
```
- cf：[CentOS7 の mailx コマンドで、外部のSMTPサーバを経由してメール送信](https://ttandai.info/archives/1913)

