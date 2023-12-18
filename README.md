[![Makefile CI](https://github.com/rzuckerm/vimscript-docker-image/actions/workflows/makefile.yml/badge.svg)](https://github.com/rzuckerm/vimscript-docker-image/actions/workflows/makefile.yml)

# vimscript-docker-image

Docker image for [Vimscript programming language](https://www.vim.org/):

- rzuckerm/vimscript:`<version>-<tag>`

where:

- `<version>` is the [Vimscript version](VIMSCRIPT_VERSION)
- `<tag>` is the current GitHub tag without the "v"

The docker image can be found [here](https://hub.docker.com/r/rzuckerm/vimscript).

## Program Structure

The Vimscript program is expected to have a `Main` function that takes a variable
number of arguments. For example:

```vim
function Main(...)
    <your script here>
endfunction
```

## Running Vimscript

To run a Vimscript program, use this command:

```
run_vim <program_filename> [<args>]
```

where:

- `<program_filename>` is the filename of the program -- e.g. `hello-world.vim`
- `<args>` are the optional script arguments

The `run_vim` command does the following:

- Call the program like this:

  ```
  vim -n -T dumb \
    --cmd ":source <program_filename>" \
    --cmd ":call Main(<args-string>)" \
    --cmd ":quit!"
  ```

- Clean up the output, changing `"\n\n"` to `"\n"` and removing VT100 escape code

where:

- `<args-string>` are the command line arguments (if any) with the appropriate
  quoting and escaping separated by commas

For example, this:

```
run_vim my-script.vim arg1 "Hello, 'World!'"
```

becomes this:

```
vim -n -T dumb \
    --cmd ":source my-script.vim" \
    --cmd ":call Main('arg1', 'Hello, \'World!\'')" \
    --cmd ":quit!"
```
