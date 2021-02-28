. ./PACKAGE.FS
. fsbuild/system.sh

BUILDDIR=fsbuild/_build
PLUGINDIR=$BUILDDIR/$PACKAGE_NAME_PRETTY
BINDIR=$PLUGINDIR/$SYSTEM_OS/$SYSTEM_ARCH
# For now:
DATADIR=$BINDIR

rm -Rf $PLUGINDIR
mkdir -p $BINDIR

if [ "$SYSTEM_OS" = "macOS" ]; then
false
else
cp -a $BUILDDIR/pyinstaller/$PACKAGE_NAME/* $BINDIR/
fi

mkdir -p $DATADIR
cp -a data/* $DATADIR/

mkdir -p $DATADIR/arcade
cp -a ./arcade/res $DATADIR/arcade/
mkdir -p $DATADIR/launcher
cp -a ./launcher/res $DATADIR/launcher/
mkdir -p $DATADIR/fsgamesys
cp -a ./fsgamesys/res $DATADIR/fsgamesys/
mkdir -p $DATADIR/fsui
cp -a ./fsui/res $DATADIR/fsui/
mkdir -p $DATADIR/workspace
cp -a ./workspace/res $DATADIR/workspace/

echo $PACKAGE_VERSION > $PLUGINDIR/Version.txt
echo $PACKAGE_VERSION > $BINDIR/Version.txt