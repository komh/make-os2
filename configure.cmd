extproc sh

d=$(dirname "$0" | tr '\\' /)

n=configure
test -f "$d/$n." || { echo "\`$d/$n' not found !!!"; exit 1; }

export ac_executable_extensions=".exe"
export CPPFLAGS="-D__ST_MT_ERRNO__"
export CFLAGS="-O2 -Zomf -Zmt"

LDFLAGS="-Zcrtdll -Zstack 0x6000 -Zhigh-mem -Zlinker /pm:vio"
if test x"$EMXOMFLD_TYPE" != xWLINK -a x"$EMXOMFLD_TYPE" != xwlink ; then
  LDFLAGS="$LDFLAGS -Zlinker /exepack:2"
fi
export LDFLAGS

export RANLIB="echo"
export AR="emxomfar"

opts="--prefix=/@unixroot/usr/local"

"$d/$n" $opts "$@" 2>&1 | tee "$n.log"
exit ${PIPESTATUS[0]}
