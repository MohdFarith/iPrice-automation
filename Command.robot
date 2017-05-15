#All Test Chrome
pybot --outputdir ChromeReports -i test -v browser:chrome TestCases/

#All Test Firefox
pybot --outputdir FirefoxReports -i test -v browser:firefox TestCases/

#All Test IE
pybot --outputdir IEReports -i test -v browser:ie TestCases/

#All Test Parallel
pabot -i test -v browser:chrome TestCases/
pabot -i test -v browser:firefox TestCases/