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
listas=$(zmprov gadl $1)
novodominio=$2

# Mensagens


for i in $listas
do
    # Para cada lista devo pegar os membros desta lista e cadastrar na nova lista
    membros=$(zmprov gdlm $i|grep -v "^$|#|members")
    listadomain=$(echo $i|awk -F "@" '{print $2}')
    nomelista=$(echo $i|awk -F "@" '{print $1}')
    novalistadomain=$nomelista+"@"+$novodominio
    for i in $membros
    do
# zmprov adlm lista membro
    done

done 
