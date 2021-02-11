Simple password breach checker that uses Have I Been Pwned API. It's 100% safe to check any password since this script never send your password to anywhere, you can check source at check.rb. For more details about how it works, please refeer to [HaveIBeenPwned Api Docs](https://haveibeenpwned.com/API/v2#SearchingPwnedPasswordsByRange)

## Usage
You need ruby and rest-client gem installed. If you don't have ruby at your machine, please refeer to ruby official docs.

### With Docker

```
$ docker build . -t rbeenpwned
$ docker run -it rbeenpwned
```

Or just chain commands  
```
$ docker build . -t rbeenpwned && docker run -it rbeenpwned
```

### Without Docker

To install rest-client just run bundle:

> $ bundle

To check any password call:

> $ ruby check.rb 123456

Replace *123456* by your password.

**CAUTION:** This script doesn't send your password to anywhere, but the call of this script will be probably logged into your O.S., use it only in machines that you can trust

