#!/bin/bash
#No. of structures whose energy is to be estimated
iterations=30


rm -r maps_is_running
maps -d &

i=1
while [ $i -le $iterations ]
do
    #list folder name and store it in array
    strDir1=$(ls -d */)
    strDir1=${strDir1///}
    arrDir1=($strDir1)
    touch ready
    
    #do while implemetation using while loop
    while : ;
    do
        sleep 5
        
        strDir2=$(ls -d */)
        strDir2=${strDir2///}
        arrDir2=($strDir2)
        
        #Compare arrays
        newFolder=$(echo ${arrDir1[@]} ${arrDir2[@]} | tr ' ' '\n' | sort | uniq -u)
        #if new folder has been created by "touch ready" command the loop will break
        [[ -z "$newFolder" ]] || break
    done
    
    cd $newFolder
    echo "Running for structure $newFolder"
    ../runstruct_qe
    energy=$(cat energy)
    echo "Structure: $newFolder, Energy: $energy"
    cd ..
    
    ((i++))
done

touch stop
