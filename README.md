Hackintools plugin
===

This is plugin for Oh My Zsh framework for hackintosh macOS users.

To install this plugin clone this repo into `$ZSH/custom/plugins` folder, then enable it in `~/.zhrc`:

```
plugins=(... hackintools)
```

# Important note

This plugin is still under development, some functions may not work or work improperly.

## Commands

| Command    | Description                                             |
|:-----------|:--------------------------------------------------------|
|`openvs`    |Open file or folder in Visual Studio Code                |
|`mountefi`  |List and mount EFI partitions found on the system        |
|`umountefi` |Umount EFI partitions previously mounted via `mountefi`  |
|`oc`        |Open OpenCore management tool                            |

---

## License

Copyright 2020 [hasashin](https://github.com/hasashin)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
