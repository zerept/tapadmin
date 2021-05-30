#!/bin/bash

#VARIAVEIS INICIAIS E AJUSTE DE TELA
    clear
# wmctrl -r :ACTIVE: -e 0,25,25,1000,800
# wmctrl -r :ACTIVE: -b toggle,maximized_vert
    pagina=" MENU PRINCIPAL "
    opcao="0"
    menuPrincipal=(' ( 01 ) FERRAMENTAS DE SISTEMA' ' ( 02 ) FERRAMENTAS DE REDE ' ' ( 03 ) INFORMAÇÕES DE HARDWARE ' ' ( 00 ) SAIR ')
    # menuPrincipal=(' ( 01 ) FERRAMENTAS DE SISTEMA' ' ( 02 ) FERRAMENTAS DE REDE ' ' ( 03 ) INFORMAÇÕES DE HARDWARE ' ' ' ' ( 99 ) SOBRE O TAP ADMIN ' ' ( 00 ) SAIR ')

#FUNÇÕES
    #VARIAVEIS DO MENU
        sistema(){
            pagina=" MENU PRINCIPAL | FERRAMENTAS DE SISTEMA "
            menuPrincipal=( ' ( 001 ) Atualizar repositorios' ' ( 002 ) Atualizar programas' ' ( 003 ) Instalar programas' '( 004 ) Remover programas' '( 005 ) Instalar dependências' '( 006 ) Limpando programas desnecessários' '( 007 ) Corrigir erros de pacote' '( 010 ) USUÁRIOS' ' ' ' ( 999 ) VOLTAR')
        }

        usuarios(){
            pagina=" MENU PRINCIPAL | FERRAMENTAS DE SISTEMA | USUÁRIOS "
            menuPrincipal=(' ( 011 ) Ver usuarios cadastrados' ' ( 012 ) Cadastrar usuarios' ' ( 013 ) Excluir usuarios' ' ( 014 ) Criar/Alterar senha de usuarios' ' ( 015 ) Adicionar permissão de administrador' ' ( 016 ) Remover permissão de administrador' ' ' ' ( 01 ) VOLTAR')
        }

        rede(){
            pagina=" MENU PRINCIPAL | FERRAMENTAS DE REDE "
            menuPrincipal=(' ( 100 ) Instalar programas necessários para usar as ferramentas de rede' ' ' '( 101 ) Verificar trafego na rede.' ' ( 102 ) Verificar dispositivos na rede.' '( 103 ) Testar conectividade de um ip ou dominio.' '( 104 ) Testar rota até o destino de um ip ou dominio.com.' '( 105 ) Ver estatísticas sobre conexões ativas com a Internet.' '( 106 ) Testar portas de um ip ou dominio.com de destino.' ' ( 107 ) Ver IP' ' ' ' ( 999 ) VOLTAR')
        }

        hardware(){
            pagina=" MENU PRINCIPAL | INFORMAÇÕES DE HARDWARE "
            menuPrincipal=(' ( 200 ) Instalar programas necessários para usar as informações de hardware' ' ' ' ( 201 ) Ver hardware (completo)' ' ( 202 ) Memória' ' ( 203 ) Limpa memória' ' ( 204 ) Processador'  ' '  ' ( 999 ) VOLTAR')
        }

        voltar(){
            pagina=" MENU PRINCIPAL "
            menuPrincipal=(' ( 01 ) FERRAMENTAS DE SISTEMA' ' ( 02 ) FERRAMENTAS DE REDE ' ' ( 03 ) INFORMAÇÕES DE HARDWARE ' ' ( 00 ) SAIR ')
        }

        sair(){
            echo -e '                                                     \033[05;31mSAINDO\033[00;37m'
            echo
            sleep 2
            echo "                                                     TCHAU... o/ "
            sleep 3
            wmctrl -r :ACTIVE: -b remove,maximized_vert
            wmctrl -r :ACTIVE: -e 0,25,25,800,400
            clear;
            exit;
        }

        sobre(){
            echo -e '\033[01;32mSobre o TAP ADMIN\033[00;37m'
            echo    
            sudo cat /etc/tapadmin/sobre
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x       
        } 

    #FERRAMENTAS DE SISTEMA
        instala_sistema(){
            echo -e '\033[01;32mInstalando programas necessários...\033[00;37m'
            echo    
            #sudo apt install arp-scan traceroute iputils-ping nmap nload
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x       
        }

        atualiza_repo(){
            echo -e '\033[01;32mAtualizando repositorios...\033[00;37m'
            echo
            sudo apt-get update
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x
        }

        atualiza_prog(){
            echo -e '\033[01;32mAtualizando programas...\033[00;37m'
            sudo apt-get update
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x
        }

        instala_prog(){
            echo -e '\033[01;32mInstalando programas...\033[00;37m'
            echo
            echo "Informe o nome do pacote para ser instalado?"
            read nome_prog
            sudo apt install $nome_prog
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x      
        }

        remove_prog(){
            echo -e '\033[01;32mRemovendo programas...\033[00;37m'
            echo
            echo "Informe o nome do pacote para ser removido?"
            read nome_prog
            sudo apt remove --purge $nome_prog
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x      
        }

        instala_dependencia(){
            echo -e '\033[01;32mInstalar dependências...\033[00;37m'
            echo    
            sudo apt-get -f install
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x       
        }

        remove_repo(){
            echo -e '\033[01;32mRemovendo arquivos desnecessário...\033[00;37m'
            echo    
            sudo apt-get autoremove
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x       
        }

        repara_repo(){
            echo -e '\033[01;32mReparando repositorios...\033[00;37m'
            echo    
            sudo dpkg --configure -a
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x       
        }
    #FERRAMENTAS DE USUÁRIO
        ver_usuarios_cadastrados(){
            echo -e '\033[01;32mUsuários cadastrado no sistema.\033[00;37m'
            echo    
            sudo getent passwd
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x       
        }

        cadastrar_usuario(){
            echo -e '\033[01;32mCadastrar usuário! \033[00;37m'
            echo
            echo "Informe o nome do usuário a ser cadastrado !"
            read nome_usuario
            sudo sudo useradd -m $nome_usuario
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x      
        }
        deletar_usuario(){
            echo -e '\033[01;32mDeletar usuário! \033[00;37m'
            echo
            echo "Informe o nome do usuário a ser deletado !"
            read nome_usuario
            sudo sudo userdel -r $nome_usuario
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x      
        }

        senha_usuario(){
            echo -e '\033[01;32mAlterar senha de usuário! \033[00;37m'
            echo
            echo "Informe o nome do usuário !"
            read nome_usuario
            sudo sudo passwd $nome_usuario
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x      
        }

        add_sudo(){
            echo -e '\033[01;32mAdicionar permissão de administrador para o usuario usuário(root)! \033[00;37m'
            echo
            echo "Informe o nome do usuário !"
            read nome_usuario
            sudo usermod -a -G sudo $nome_usuario
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x      
        }

        remove_sudo(){
            echo -e '\033[01;32mRemove permissão de administrador do usuário (root)! \033[00;37m'
            echo
            echo "Informe o nome do usuário !"
            read nome_usuario
            sudo usermod -a -G sudo $nome_usuario
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x      
        }

    #FERRAMENTAS DE REDE
        instala_rede(){
            echo -e '\033[01;32mInstalando programas necessários...\033[00;37m'
            echo    
            sudo apt install arp-scan traceroute iputils-ping nmap nload curl
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x       
        }

        ver_trafego_rede(){
            echo -e '\033[01;32mVerificando trafego na rede...\033[00;37m'
            echo    
            sudo nload
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x       
        }

        ver_rede(){
            echo -e '\033[01;32mVerificando dispositivos na rede...\033[00;37m'
            echo    
            sudo arp-scan -l
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x       ´
        }

        ver_ping(){
            echo -e '\033[01;32mTestar conectividade de um ip ou dominio.com ! \033[00;37m'
            echo
            echo "Informe o ip ou dominio.com !"
            read ip_dominio
            sudo ping -c5 $ip_dominio
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x      
        }

        ver_traceroute(){
            echo -e '\033[01;32mTestar rota até um ip ou dominio.com de destino ! \033[00;37m'
            echo
            echo "Informe o ip ou dominio.com !"
            read ip_dominio
            sudo traceroute -q5 -n $ip_dominio 100
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x      
        }

        ver_con_ativa(){
            echo -e '\033[01;32mVer estatísticas sobre conexões ativas com a Internet. \033[00;37m'
            echo
            sudo netstat -natp
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x    
        }

        ver_nmap(){
            echo -e '\033[01;32mTestar portas de um ip ou dominio.com de destino ! \033[00;37m'
            echo
            echo "Informe o ip ou dominio.com !"
            read ip_dominio
            read -p "Deseja ver apenas as portas padrões? (s/n) (s=recomendado/rapido)" nmap_portas
            read -p "Deseja ver a rede interna do destino (s/n) (n=recomendado/rapido)" nmap_rede
            echo

            case $nmap_portas in  
                s|S) 
                    vnmap_portas="" ;; 
                n|N) 
                    vnmap_portas="-p 1-65535" ;; 
                *) echo "Opção inválida" ;; 
            esac

            case $nmap_rede in  
                s|S) 
                    vnmap_rede="/24" ;; 
                n|N) 
                    vnmap_rede="" ;; 
                *) echo "Opção inválida";; 
            esac

            sudo nmap $vnmap_portas $ip_dominio$vnmap_rede
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x      
        }

        ver_ip(){
            echo -e '\033[01;32m Meu IP \033[00;37m'
            echo
            echo "IP INTERNO"
            sudo ifconfig | grep 'inet 1'
            echo
            echo "IP EXTERNO"
            sudo curl ifconfig.me
            echo
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x    
        }    

    #INFORMAÇÕES DE HARDWARE
        instala_hardware(){
            echo -e '\033[01;32mInstalando programas necessários...\033[00;37m'
            echo    
            sudo apt install inxi lshw
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x       
        }

        info_hardware(){
            echo -e '\033[01;32m Meu hardware \033[00;37m'
            echo
            sudo inxi -F
            echo
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x    
        }

        ver_memoria(){
            echo -e '\033[01;32m Memória \033[00;37m'
            echo
            sudo free -m
            echo
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x    
        }

        limpa_memoria(){
            echo -e '\033[01;32m Limpando memória \033[00;37m'
            sleep 2
            echo
            sudo bash limpa_memoria.sh
            echo
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x    
        }        

        ver_cpu(){
            echo -e '\033[01;32m CPU (processador) \033[00;37m'
            echo
            sudo lshw -class CPU | sed -n '3,13p'
            echo
            echo
            echo -e '\033[01;32mAperte Enter para continuar !!!\033[00;37m'
            read x    
        }

    #MENU
        menu ()
        {
            while true $opcao != "0"
            do
                clear
                echo    "                        ############################################################"
                echo    "                        #    ____  ____  ____      ____  ____  ____  ____  ____    #"
                echo -e "                        #   ||\033[01;32mT\033[00;37m ||||\033[01;32mA\033[00;37m ||||\033[01;32mP\033[00;37m ||    ||\033[01;32mA\033[00;37m ||||\033[01;32mD\033[00;37m ||||\033[01;32mM\033[00;37m ||||\033[01;32mI\033[00;37m ||||\033[01;32mN\033[00;37m ||   #"
                echo    "                        #   ||__||||__||||__||    ||__||||__||||__||||__||||__||   #"
                echo    "                        #   |/__\||/__\||/__\|    |/__\||/__\||/__\||/__\||/__\|   #"
                echo    "                        #                                                          #"
                echo -e "                        #   \033[01;32mVersão 0.3                  Atualizada em 21/06/2020\033[00;37m   #"
                echo    "                        ############################################################"
                echo -e "                        $(date +%d/%m/%y)  $(date +%H:%M:%S)                   \033[01;32mPor Thiago Airold Perez\033[00;37m"
                echo
                echo -e '\033[01;32m'$pagina'\033[00;37m'
            
                echo        
                echo
                #TITULO
                for i in "${menuPrincipal[@]}"; do
                    echo $i
                done
                echo
                echo -e "\033[01;32mDigite a opção desejada: \033[00;37m" 
                read opcao
                echo
                echo    "                        ############################################################"
                echo

                case "$opcao" in
                    #menu principal
                        01) sistema;;
                        02) rede;;
                        03) hardware;;
                        999) voltar;;
#                        99) sobre;;
                        00) sair;;

                    #submenu sistema
                        000) instala_sistema;;
                        001) atualiza_repo;;
                        002) atualiza_prog;;
                        003) instala_prog;;
                        004) remove_prog;;
                        005) instala_dependencia;;
                        006) remove_repo;;
                        007) repara_repo;;
                        010) usuarios;;
                        011) ver_usuarios_cadastrados;;
                        012) cadastrar_usuario;;
                        013) deletar_usuario;;
                        014) senha_usuario;;
                        015) add_sudo;;
                        016) remove_sudo;;
                
                    #submenu rede
                        100) instala_rede;;
                        101) ver_trafego_rede;;
                        102) ver_rede;;     
                        103) ver_ping;;  
                        104) ver_traceroute;;  
                        105) ver_con_ativa;;
                        106) ver_nmap;;
                        107) ver_ip;;

                    #submenu hardware
                        200) instala_hardware;;  
                        201) info_hardware;;
                        202) ver_memoria;;
                        203) limpa_memoria;;
                        204) ver_cpu;;

                    #else   
                        *)
                        echo -e "                                        \033[05;31mOPÇÃO '"$opcao"' NÃO É VÁLIDA !!!\033[00;37m"
                        sleep 4
                esac
            done
        }

#CHAMA TODO O PROCESSO
    menu    
