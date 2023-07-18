# consul_mesh_test

To replicate update CONTEXT in the \*.sh scripts and run..

```
cd dc1/helm
./install.sh
cd ..
./configs.sh
cd ../dc2/helm
./install.sh
cd ..
./configs.sh
cd ../dc1
./peering.sh
cd ../dc2
./peering.sh
```

Then delete a mesh-gateway pod in dc2.
