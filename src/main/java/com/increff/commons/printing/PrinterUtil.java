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

import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.printing.PDFPageable;

public class PrinterUtil {

	/**
	 * Locates all print services
	 * @return List of PrintService objects
	 */
	public static PrintService[] getPrintServices() {
		return PrintServiceLookup.lookupPrintServices(null, null);
	}

	/**
	 * @return Returns list of printer names
	 */
	public static List<String> getPrinterNames() {
		return Arrays.stream(getPrintServices()).map(x -> x.getName()).collect(Collectors.toList());
	}

	/**
	 * Get PrintService object based on name. Returns the first match if found, null otherwise
	 * @param name Name of printer to be searched
	 * @return Fetched PrintService object
	 */
	public static PrintService getPrintService(String name) {
		return Arrays.stream(getPrintServices()).filter(x -> x.getName().equals(name)).findFirst().orElse(null);
	}

	/**
	 * Prints pages from a PDF
	 * @param printerName Name of printer to be used
	 * @param is Input stream to be used for printing
	 */
	public static void printPdf(String printerName, InputStream is) throws IOException, PrintException,
			InterruptedException, PrinterException {
		PrintService printService = getPrintService(printerName);
		PrinterJob job = PrinterJob.getPrinterJob();
		job.setPrintService(printService);
		PDDocument doc = PDDocument.load(is);
		job.setPageable(new PDFPageable(doc));
		job.print();
	}

	/**
	 * Print pages from other Document formats
	 * @param printerName Name of printer to be used
	 * @param is Input stream to be used for printing
	 */
	public static void printDocument(String printerName, InputStream is) throws IOException, PrintException,
			InterruptedException, PrinterException {
		PrintService printService = getPrintService(printerName);
		Doc doc = new SimpleDoc(is, DocFlavor.INPUT_STREAM.AUTOSENSE, null);
		print(printService, doc);
		is.close();
	}

	public static void print(PrintService ps, Doc doc) throws IOException, PrintException {
		PrintRequestAttributeSet attributes = new HashPrintRequestAttributeSet();
		DocPrintJob job = ps.createPrintJob();
		job.print(doc, attributes);
	}

}
