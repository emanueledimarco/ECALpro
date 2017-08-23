#!/bin/bash                                                                        

# usage:  source drawICmap.sh [options]
# available options
# -noEB  -->  skip EB
# -noEE  -->  skip EE
                                                                                  
# iter_ini=0
# iter_fin=7  # it is included in sequence below                                   
                                                                     
# path="/store/group/dpg_ecal/alca_ecalcalib/piZero2016/mciprian/"
# dirName="AlcaP0_2016_json2p07fb"
# tagName="AlcaP0_2016_json2p07fb_"

iter_ini=0
iter_fin=6  # it is included in sequence below                     

wwwPath="icplots/"
eosPath="/store/group/dpg_ecal/alca_ecalcalib/piZero2016/mciprian/"
#eosPath="/store/group/dpg_ecal/alca_ecalcalib/piZero2016/emanuele/"
#eosPath="/store/group/dpg_ecal/alca_ecalcalib/piZero2016/zhicaiz/"
dirName="AlcaP0_2016H_mar2017newCond_reg2012"
tagName="AlcaP0_2016H_mar2017newCond_reg2012_"

ECALdetToSkip=""

for option in "$@";
do
    if [ "$option" = "-noEB" ]; then
	ECALdetToSkip="EB"
    elif [ "$option" = "-noEE" ]; then
        ECALdetToSkip="EE"
    fi
done


for i in `seq $iter_ini $iter_fin`
do
    iterNumber="iter_$i"
    mkdir -p $wwwPath/$dirName/$iterNumber/2DMaps/Barrel
    mkdir -p $wwwPath/$dirName/$iterNumber/2DMaps/Endcap/EEp
    mkdir -p $wwwPath/$dirName/$iterNumber/2DMaps/Endcap/EEm
    echo  "iter_$i"
    root -l -b -q 'drawICmap.C+("'$wwwPath'","'$eosPath'","'$dirName'","'$iterNumber'","'$tagName'","'$ECALdetToSkip'")'
done

