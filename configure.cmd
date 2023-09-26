extproc sh

d=$(dirname "$0" | tr '\\' /)

n=configure
test -f "$d/$n." || { echo "\`$d/$n' not found !!!"; exit 1; }

export ac_executable_extensions=".exe"
export CPPFLAGS="-D__ST_MT_ERRNO__"
export CFLAGS="-O2 -Zomf -Zmt"
if test x"$EMXOMFLD_TYPE" = xWLINK || test x"$EMXOMFLD_TYPE" = xwlink ; then
  export LDFLAGS="-Zcrtdll -Zlinker /pm:vio -Zstack 0x6000"
else
  export LDFLAGS="-Zcrtdll -Zlinker /exepack:2 -Zlinker /pm:vio -Zstack 0x6000"
fi
export RANLIB="echo"
export AR="emxomfar"

opts=""
"$d/$n" $opts "$@" 2>&1 | tee "$n.log"
