echo "Setting up path"
for binary in $binaries; do
   export PATH="$binary/bin:$PATH"
done

echo "Starting build script"
source $buildScript
