# commons-lang
commons-printing provides methods to deal with printers and printing tasks. It allows the identification of available printers as well the processing of printing jobs on the printers

## Usage
### pom.xml
To use commons-printing, include the following in the projects pom.xml
```xml
<dependency>
    <groupId>com.increff.commons</groupId>
    <artifactId>commons-printing</artifactId>
    <version>{commons-printer.version}</version>
</dependency>
```

## Key Classes
### PrinterUtil
PrinterUtil contains the following key methods

- `PrintService[] getPrintServices()` Locates all print services/printers that might be available. For each detected print service, a PrintService object is returned which contains information regarding that printer
- `List<String> getPrinterNames()` Locates all print services/printers that might be available and returns a list of all names for each PrintService detected
- `PrintService getPrintService(String name)` Allows fetching a print service based on its name. Returns the first match if multiple matches exist and returns a null value if no matches are found
- `void printPdf(String printerName, InputStream is)` Print a PDF on a printer with name printerName. Reads the PDF from the InputStream, is
- `void printDocument(String printerName, InputStream is)` Prints other documents read from the InputStream on a printer with the specified printerName. Automatically detects the type of document and converts it into a javax Doc object before printing

## License
Copyright (c) Increff

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License
is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
or implied. See the License for the specific language governing permissions and limitations under
the License.
