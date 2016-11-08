# tcd-so-2016 implementando uma syscall no kernel Linux.

Documentacao oficial encontrada em linux-4.4.XX/Documentation/adding-syscalls.txt

Tutorial "quickstart": https://ulrichbuschbaum.wordpress.com/2016/05/03/linux-syscall-in-kernel-v4-5/

Passos para a compilação de um kernel genérico:

1. baixar ultimo kernel longterm 4.4 em [kernel.org](https://www.kernel.org/)
2. descompactar o source code:

    ```shell
    tar -xf 'linux-4.4.XX.tar.xz'
    ```

3. copiar e atualizar a configuração do kernel atual:

    ```shell
    cd linux-4.4.XX
    cp /boot/config-$(uname -r) .config
    yes '' | make oldconfig
    ```

4. (opcional) selecionar somente módulos usados pelo kernel atual:

    ```shell
    make localmodconfig
    ```

5. compilar e instalar kernel e módulos:

    ```shell
    export MAX_JOBS=$(($(nproc) + 1)) MAX_LOAD=$(nproc)
    make -j$MAX_JOBS -l$MAX_LOAD
    make -j$MAX_JOBS -l$MAX_LOAD modules
    sudo make -j$MAX_JOBS -l$MAX_LOAD modules_install
    sudo make -j$MAX_JOBS -l$MAX_LOAD install
    ```
