// see https://processing.org/reference/libraries/pdf/index.html
// deliverable04 template by golan 
import processing.pdf.*;
boolean bRecordingPDF;
int pdfOutputCount = 0; 
 
void setup() {
  size(600, 400);
  bRecordingPDF = true;
}
 
void keyPressed() {
  // When you press a key, it will initiate a PDF export
  bRecordingPDF = true;
}

class LineInfo {
  int x1, x2, y1, y2;
  LineInfo(int x1, int y1, int x2, int y2) {
   this.x1 = x1;
   this.x2 = x2;
   this.y1 = y1;
   this.y2 = y2;
  }
}
 
void draw() {
  if (bRecordingPDF) {
    background(255); // this should come BEFORE beginRecord()
    beginRecord(PDF, "myName_" + pdfOutputCount + ".pdf");
 
    //--------------------------
    noFill(); 
    int mid = width/2;
    strokeWeight(1.5);
    LineInfo[] lines = { new LineInfo(10,200,mid+10,200),
                         new LineInfo(10,210,mid-10,210),
                         new LineInfo(10,190,mid+5,190),
                         new LineInfo(10,185,mid-5,185),
                         new LineInfo(10,172,mid,172),
                         new LineInfo(10,230,mid,230),
                         new LineInfo(10,240,mid+2,240),
                         new LineInfo(10,168,mid-15,168) };

    for (int i = 0; i < lines.length; i++) {
      beginShape();
      smooth();
      LineInfo l = lines[i];
      line(l.x1,l.y1,l.x2,l.y2); 
      curveVertex(l.x2,l.y2);
      curveVertex(l.x2,l.y2);
      float rx = l.x2;
      float ry= l.y2;
      for (int j=0; j < 100; j++) {
        rx = rx + random(12,14); 
        ry = ry + random(-30, 25); 
        curveVertex(rx, ry);
      }
      endShape();
    }
     
    endRecord();
    bRecordingPDF = false;
    pdfOutputCount++;
  }
}