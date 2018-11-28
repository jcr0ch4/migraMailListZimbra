#!/bin/bash
#
#  migraLista.sh
#  
#  Copyright 2018 Jose Carlos <jcr0ch4@gmail.com>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.

# Listas de E-mail

# Preciso verificar se os paramstros 1 e dois foram informados
if [ -z $1 ]
then
    echo "Não foi informado o nome da lista de e-mail"
else
    listas=$(zmprov gadl $1)
    if [ -z $2 ]
    then 
	    echo "Não foi informado o segundo paramentro,
	    O segundo parametro deve ser o nome do novo dominio de e-mail"
    else
	novodominio=$2

        for i in $listas
	do
	    # Para cada lista devo pegar os membros desta lista e cadastrar na nova lista
	    membros=$(zmprov gdlm $i|egrep -v "^$|#|members")
	    listadomain=$(echo $i|awk -F "@" '{print $2}')
	    nomelista=$(echo $i|awk -F "@" '{print $1}')
	    novalistadomain=$nomelista"@"$novodominio
	    # Será necessário criar a nova lista
	    echo "Novo Dominio -> $novalistadomain"
	    for x in $membros
	    do
	            # zmprov adlm lista membro
		    zmprov adlm $novalistadomain $x && echo "Adicionado a lista $novalistadomain o membro $x ....   [ OK ]"||echo "Erro ao adicionar a lista $i o membro $x ....   [ Falhou ]"
	    done
	
	done 
    fi
fi
