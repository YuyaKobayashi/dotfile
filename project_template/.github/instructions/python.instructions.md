---
applyTo: "**.py"
---

- Coding Rule
  - Indent must be of 4 spaces. Do not use tab.
  - Write type hint at function signature. DO not write type hint in local variable.
  - Names of private methods and variable must starts with `_`.
  - Do not write multiplle state in one line (e.g. if (True): print("Hello");)
  - When `if-elif` clause is used for simulating `switch` in C-lang, please add `else` clause with `assert False` or exception raise to archieve defeisive code.

- Library Usage
  - Do not use `os.path`. Use `pathlib` instead.
  - When using np.ndarray in function signature, write assumed shape and dtype in docstring.

