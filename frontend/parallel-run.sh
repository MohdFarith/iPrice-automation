#!/bin/bash

# Run Setup
mkdir -p Reports; rm -f Reports/*.html Reports/*.png Reports/*.xml;

# Run Security Matrix Test Suite
time parallel --jobs 250% --delay 5 --progress pybot --nostatusrc -d Reports -o "{#}_case.xml" -l "{#}_case.log" -r "{#}_case.html" -i "{#}_case" -v browser:chrome 001-iPriceHomepageTestCase.robot ::: {0..3}

# Merge Reports
rebot --outputdir Reports --output all.xml --merge Reports/*.xml

# Delete Inividual Reports
#rm Reports/*_case.html Reports/*_case.xml Reports/*_case.log
