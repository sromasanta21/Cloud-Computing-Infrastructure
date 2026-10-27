Adding Code
===========

Working with Code Snippets
--------------------------

You can include code snippets using ``code-block`` directive as shown below:

.. code-block:: rst

    .. code-block:: python

        # Some Python code
        print("Hello World!")


The above ``code-block`` will generate a code block with syntax highlighting for the specified language.

.. code-block:: python

    # Some Python code
    print("Hello World!")


You can also use the ``prompt`` directive to display CLI commands. For example, to create a Bash prompt, use

.. code-block:: bash

    .. prompt:: bash $

        sudo apt update && sudo apt upgrade

This will create a code block with a Bash prompt as shown below:

.. prompt:: bash $

    sudo apt update && sudo apt upgrade


Adding Code Files
-----------------

To display code directly from files, you can use the ``literalinclude`` directive.

.. code-block:: rst

    .. literalinclude:: ../../../code/sample.py
      :language: python
      :linenos:
      :caption: sample.py

This will display the ``sample.py`` file located in the ``code`` directory and use Python syntax highlighting as shown below:

.. literalinclude:: ../../../code/sample.py
    :language: python
    :linenos:
    :caption: sample.py


Adding Git Repos
----------------

Add submodules
^^^^^^^^^^^^^^
To add Git repositories to the documentation, navigate to the ``source`` folder and use

.. prompt:: bash $

    cd source
    git submodule add <remote_url> <destination_folder>


Commit changes
^^^^^^^^^^^^^^
Adding a Git submodule will stage your submodule. You should now commit your submodule by using the ``git commit`` command.

.. prompt:: bash $

    git commit -m "Added the submodule to the project."
    git push

Update submodules
+++++++++++++++++

To update/pull a submodule, use the ``git submodule update`` command.

.. prompt:: bash $

    git submodule update --init --recursive
