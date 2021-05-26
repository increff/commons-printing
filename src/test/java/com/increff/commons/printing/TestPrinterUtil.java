/*
 * Copyright (c) 2021. Increff
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 */

package com.increff.commons.printing;

import org.junit.Test;

import com.increff.commons.printing.PrinterUtil;

import org.junit.Ignore;
import javax.print.PrintException;
import java.awt.print.PrinterException;
import java.io.*;

import static org.junit.Assert.assertNotNull;

public class TestPrinterUtil {

	@Ignore
	@Test
	public void testGetPrinterNames() {
		PrinterUtil.getPrinterNames().forEach(System.out::println);
	}

	@Test
	public void testGetPrintService() {
		PrinterUtil.getPrinterNames().forEach(name -> {
			assertNotNull(PrinterUtil.getPrintService(name));
		});
	}
	
	@Ignore
	@Test
	public void testPrintPdf() throws IOException, InterruptedException, PrinterException, PrintException {
		InputStream is = new FileInputStream(new File("src/test/resources/com/nextscm/commons/printing/test-doc.pdf"));
		PrinterUtil.printPdf("your_printer_name", is);
	}

}
