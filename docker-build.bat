@echo off
echo =^> Building QuantumOS via Docker...

docker build -t quantumos-builder .
docker run --privileged --rm -v "%cd%\build-output:/quantumos/build" quantumos-builder

echo =^> Done! Check build-output\ for the ISO.
pause
