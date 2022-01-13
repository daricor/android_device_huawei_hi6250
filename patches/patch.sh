#!/bin/bash
THISDIR=$PWD
ROM=${1}
CLEAR=${2}
TOPDIR="$THISDIR/../../../../"


checkerror() {
    if [[ ${1} -gt 0 ]]; then
	if [[ "${3}" == "-fatal" ]]; then
		echo -e "[$(basename ${0})]: ERROR: ${2}" >&2
		echo -e "[$(basename ${0})]: \t: #############################################################################" >&2
		echo -e "[$(basename ${0})]: \t: # ABORT: This ROM may not build or may not boot unless this patch is fixed. #" >&2
		echo -e "[$(basename ${0})]: \t: #############################################################################" >&2
		exit 9
	else
		echo -e "[$(basename ${0})]: WARNING: ${2}" >&2	
	fi
    fi
}


if [[ "$ROM" == "" ]]; then
	cd $TOPDIR
	if [[ -e vendor/cm ]]; then
		if [[ $(cat vendor/cm/README.mkdn | grep -c "Resurrection Remix") -gt 0 ]]; then
			ROM="rr"
		else
			ROM="lineage"
		fi
	elif [[ -e vendor/slim ]]; then
		ROM="slim"
	elif [[ -e vendor/omni ]]; then
		ROM="omni"
	elif [[ -e vendor/validus ]]; then
		ROM="validus"
	else
		ROM="aosp"
	fi
	echo "ROM not specified. found $ROM"
	sleep 1
	cd $THISDIR	
	
fi
if [[ "$CLEAR" == "" ]]; then
	./clearpatches.sh $ROM
fi

cd $ROM
for LINE in $(find -L -name *.patch | sort )
do

	
	PATCH=$THISDIR/$ROM/$LINE
	REPO=$(dirname $LINE)
	PATCHFATAL=""

        if [[ "$(basename $PATCH)" == *critical* ]];then
	    PATCHFATAL="-fatal"
	fi
        if [[ "$(basename $PATCH)" == *meticulus* ]] && [[ "$I_AM_METICULUS" != true ]]; then
	    checkerror 1 "Skipping $(basename $PATCH): You are not Meticulus."
	    continue;
	fi

	cd $TOPDIR
	if [[ ! -e $REPO ]]; then
		checkerror 1  "$REPO does not exist; skipping..."
		cd $THISDIR
		continue
	fi
	cd $REPO
	echo "Applying patch: $ROM - $LINE"
	patch -p1 --follow-symlinks --no-backup-if-mismatch  < $PATCH &> /dev/null
	if [[ $? -gt 0 ]]; then
		checkerror 1 "PATCH FAILED!!! $PATCH" $PATCHFATAL
	fi

	cd $THISDIR
done

cd $ROM
for LINE in $(find -L -name *.apply | sort )
do
	PATCH=$THISDIR/$ROM/$LINE
	REPO=$(dirname $LINE)
	PATCHFATAL=""

        if [[ "$(basename $PATCH)" == *critical* ]];then
	    PATCHFATAL="-fatal"
	fi
	
	cd $TOPDIR
	if [[ ! -e $REPO ]]; then
		checkerror 1 "$REPO does not exist; skipping..."
		cd $THISDIR
		continue
	fi
	cd $REPO
	echo "Applying patch: $ROM - $LINE"
        git apply --whitespace=nowarn --reject $PATCH &> /dev/null	
	checkerror $? "APPLY FAILED!!! $PATCH" $PATCHFATAL
	cd $THISDIR
done
cd $THISDIR
if [[ "$ROM" != "common" ]];then
	./patch.sh common false
fi

