export PATH="$findutils/bin:$coreutils/bin:$gnutar/bin:$gzip/bin:$gnused/bin"

source $unpack

mv $out/bin/idea.sh $out/bin/idea_inner.sh
cat $ideawrapper > $out/bin/idea.sh
chmod +x $out/bin/idea.sh

sed "s~JDK_PATH~$jdk~g" $out/bin/idea.sh | tee $out/bin/idea.sh 
sed "s~IDEA_PATH~$out~g" $out/bin/idea.sh | tee $out/bin/idea.sh
