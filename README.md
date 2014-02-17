# Bashmarks

## Installation

Include or source marks.sh from your ~/.bashrc


```bash
  [[ -s "$HOME/bin/marks.sh" ]] && . $HOME/bin/marks.sh
```

## Usage

###Mark your current directory so you can jump to it later
```bash
  $ cd /etc/sysconfig
  $ mark foo
  $ ls -l ~/.marks/foo
    lrwxrwxrwx 1 foo -> /etc/sysconfig
```

###Jump to your mark using the jump command
```bash
  $ jump foo
```

###List your marks
```bash
  $ marks
foo  -> /etc/sysconfig
bar  -> /tmp

```

###Jump to your mark using the jump command
```bash
  $ jump foo
```
