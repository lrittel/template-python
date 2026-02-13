[group("test")]
clean-test-projects:
    rm -rf test

[group("test")]
create-test-projects: clean-test-projects
    mkdir -p test

    # All features enabled.
    copier copy . test/all-features --trust \
        --data description="Tests my template" \
        --data min_python_version='3.13' \
        --data project_name=all-features \
        --data root_module_name=all_features \
        --data use_commitizen=true \
        --data use_direnv=true \
        --data use_github_workflow=true \
        --data use_just=true \
        --data use_mkdocs=true \
        --data use_nix_flake=true \
        --data use_pre_commit=true \
        --data use_py_click=true

    # No optional features enabled.
    copier copy . test/minimal-features --trust \
        --data description="Tests my template" \
        --data min_python_version='3.10' \
        --data project_name=minimal-features \
        --data root_module_name=minimal_features \
        --data use_commitizen=false \
        --data use_direnv=false \
        --data use_github_workflow=false \
        --data use_just=true \
        --data use_mkdocs=false \
        --data use_nix_flake=false \
        --data use_pre_commit=false \
        --data use_py_click=false

    # Newest Python version supported.
    copier copy . test/python-newest --trust \
        --data description="Tests the newest Python version supported" \
        --data min_python_version='3.14' \
        --data project_name=python-newest \
        --data root_module_name=python_newest \
        --data use_commitizen=true \
        --data use_direnv=true \
        --data use_github_workflow=true \
        --data use_just=true \
        --data use_mkdocs=true \
        --data use_nix_flake=true \
        --data use_pre_commit=true \
        --data use_py_click=true

    # Oldest Python version supported.
    copier copy . test/python-oldest --trust \
        --data description="Tests the oldest Python version supported" \
        --data min_python_version='3.14' \
        --data project_name=python-oldest \
        --data root_module_name=python_oldest \
        --data use_commitizen=true \
        --data use_direnv=true \
        --data use_github_workflow=true \
        --data use_just=true \
        --data use_mkdocs=true \
        --data use_nix_flake=true \
        --data use_pre_commit=true \
        --data use_py_click=true

[group("test")]
run-test-project-tests:
    #!/usr/bin/env bash

    for p in test/* ; do
        echo "+---------------------------------------"
        echo "| Running tests in $p ..."
        echo "+---------------------------------------"
        pushd "$p"
        just --allow-missing run-tests
        popd
        echo "----------------------------------------"
    done

[group("test")]
run-test-project-docs:
    #!/usr/bin/env bash

    for p in test/* ; do
        echo "+---------------------------------------"
        echo "| Building documentation in $p ..."
        echo "+---------------------------------------"
        pushd "$p"
        just --allow-missing build-docs
        popd
        echo "----------------------------------------"
    done

[group("test")]
run-test-project-programs:
    #!/usr/bin/env bash

    for p in test/* ; do
        echo "+---------------------------------------"
        echo "| Running main in $p ..."
        echo "+---------------------------------------"
        pushd "$p"
        just --allow-missing run-app --help
        popd
        echo "----------------------------------------"
    done

    # Test some extra commands
    p="test/all-features"
    echo "+---------------------------------------"
    echo "| Running extra commands in $p ..."
    echo "+---------------------------------------"
    pushd "$p"
    just run-app foo --flag-a 1 --flag-b "/" --flag-c "c" 1 41 43
    popd
    echo "----------------------------------------"


[group("test")]
run-tests: \
        clean-test-projects \
        create-test-projects \
        run-test-project-tests \
        run-test-project-docs \
        run-test-project-programs
