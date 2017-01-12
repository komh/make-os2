extproc sh

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
./configure --without-included-gettext
