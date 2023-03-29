# Bash examples

Small examples of bash scripting.

## Bash scripting conventions

| Element                    |Notation              |Example              |Notes                                                                                                                    |
|----------------------------|----------------------|---------------------|-------------------------------------------------------------------------------------------------------------------------|
| Constants                  | SCREAMING_SNAKE_CASE | DEST_PATH           | Use `readonly` or `declare -r` to ensure they are readonly.                                                             |
| Environment variable names | SCREAMING_SNAKE_CASE | PATH                |                                                                                                                         |
| File                       | snake_case           | my_script           | Executables should not have extension (strongly preferred) or a `.sh` extension.[^1]                                    |
| Functions                  | snake_case           | do_something(){ }   | The keyword `function` it's optional, but must be used consistently troughout a project.[^2]                            |
| Hashbang                   |                      | #!/usr/bin/env bash | #!/usr/bin/bash asumes it's always installed in /bin, which can cause issues.[^3]                                       |
| Local variables            | snake_case           | my_local_variable   | Ensure that local variables are only seen inside a function and it's children by using `local` when declaring them.     |
| Variables                  | snake_case           | user_name           |                                                                                                                         |

## Command calls

### Check  return values

Always check return valuies an give informative return values.
For unpiped commands use `$?` or check directly via an `if` statement.

```shell
if ! mv "${file_list[@]}" "${dest_dir}/"; then
  echo "Unable to move ${file_list[*]} to ${dest_dir}" >&2
  exit 1
fi

# Or
mv "${file_list[@]}" "${dest_dir}/"
if (( $? != 0 )); then
  echo "Unable to move ${file_list[*]} to ${dest_dir}" >&2
  exit 1
fi
```

### Builtin Commands vs External Commands

Given the choice between invoking a shell builtin and invoking a separete process, choose the builtin.

```shell
# Prefer this:
addition=$(( X + Y ))
substitution="${string/#foo/bar}"

# Instead of this:
addition="$(expr "${X}" + "${Y}")"
substitution="$(echo "${string}" | sed -e 's/^foo/bar/')"
```

## Static analysis

Use [ShellCheck](https://github.com/koalaman/shellcheck) to get warnings and suggestions for your scripts.

## Sources

* [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)

[^1]: Libraries must have a `.sh`extension and should not be executable.
[^2]: The use of the keyword `function`reduces compatibility with older versions of bash.
[^3]: Google does recommend `#!/bin/bash`

## Support

If you find these examples useful, you can star this repo.
