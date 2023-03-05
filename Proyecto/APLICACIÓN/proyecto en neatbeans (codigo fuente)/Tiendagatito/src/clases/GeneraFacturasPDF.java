package clases;

import java.io.IOException;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;


public class GeneraFacturasPDF {
    public void generaFactura() throws IOException{
        try (PDDocument document = new PDDocument()) {
            PDPage page = new PDPage(PDRectangle.A6);
            document.addPage(page);

            PDPageContentStream contentStream = new PDPageContentStream(document, page);
           

            // Text
            contentStream.beginText();
            contentStream.setFont(PDType1Font.TIMES_BOLD, 32);
            contentStream.newLineAtOffset( 20, page.getMediaBox().getHeight() - 52);
            contentStream.showText("Factura N" + ((int)Math.random()*10000));
            contentStream.endText();

            // Image
            //

            contentStream.close();

            document.save("document.pdf");
        }
    }
        
        /*public static void main(String a[]) throws IOException{
           GeneraFacturasPDF uno = new GeneraFacturasPDF();
           uno.generaFactura();
        }*/
    }

