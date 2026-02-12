# My Template for Python Projects

This repository contains the template that I am using for Python projects.

[copier](https://copier.readthedocs.io/en/stable/) is used to derive projects
from the template and to update projects after changes to this template.


## Usage
### Using copier directly
#### Dependencies

- [copier](https://copier.readthedocs.io/en/stable/), tested with ≥9.11.0
- [uv](https://docs.astral.sh/uv/), tested with ≥0.12.0
- [Just](https://just.systems/) (optional)
- [Nix](https://nix.dev/) (optional)
- [commitizen](https://commitizen-tools.github.io/commitizen/) (optional)
- [pre-commit](https://pre-commit.com/) (optional)

#### Creating a New Project

1. `cd` into the parent directory for the (not yet existing) project path.
2. Generate the project:
   `$ copier copy --trust https://github.com/lrittel/template-python.git <project path>`

   As the template contains tasks that are run after project creation, the
   `--trust` flag is required to run them.  Refer to the `_tasks:` object in
   `./copier.yml` to see which commands are run.
3. Answer the questions and generate the project.
4. 
5. Set up the environment according to the readme contained in the generated project.
6. Start programming! :)


#### Updating an Existing Project

Update an existing project to the newest revision of this template:

1. `cd` into the project directory
2. Run copier `$ copier update --trust .`


### Using Nix

This repository can be executed with `$ nix run`.


#### Dependencies

- [Nix](https://nix.dev/), tested with ≥2.28.3


#### Creating a New Project

Same as above, but replace the copier command with:
`$ nix run github:lrittel/template-python copy --trust https://github.com/lrittel/template-python.git <project path>`


#### Updating an Existing Project

Same as above, but replace the copier command with:
`$ nix run github:lrittel/template-python update --trust`
