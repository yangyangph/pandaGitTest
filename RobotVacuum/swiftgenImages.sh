
#!/bin/sh


for file in `find ./ -name "*.yml"`; do
  
  if [ $file == ".//.ProjectRoot/project.yml" ];then 
    echo 
  else
    echo $file
    swiftgen config run --config $file
  fi

done

