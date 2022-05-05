

void setup() {
  size(1600,1600,P3D);
    //createCanvas(500, 500, WEBGL);
    //angleMode(DEGREES);
    frameRate(30);
}



void myquad(PVector a, PVector b, PVector c, PVector d){
    beginShape();
    vertex(a.x, a.y, a.z);
    vertex(b.x, b.y, b.z);
    vertex(c.x, c.y, c.z);
    vertex(d.x, d.y, d.z);
    vertex(a.x, a.y, a.z);
    endShape(CLOSE);
}

void cuboid(PVector a, PVector b, PVector c){
    PVector  ah = a.copy();
    PVector  bh = b.copy();
    PVector  ch = c.copy();
    ah.div(-2);
    bh.div(-2);
    ch.div(-2);
    ah.add(bh).add(ch);
    push();
    translate(ah.x, ah.y, ah.z);
    PVector zero=new PVector(0,0,0);
    PVector ab = PVector.add(a,b);
    PVector bc = PVector.add(b,c);
    PVector ca = PVector.add(c,a);
    fill(255);
    myquad(zero, a, ab, b);
    myquad(c, ca, PVector.add(ca,b), bc);
    fill(0,125,198);
    myquad(zero, b, bc, c);
    myquad(a, ab, PVector.add(ab,c), ca);
    fill(49,57,148);
    myquad(zero, c, ca, a);
    myquad(b, bc, PVector.add(bc,a), ab);
    pop();
}

void riis(){
    PVector a = new PVector(7,0,0);
    PVector b = new PVector(0,7,0);
    PVector c = new PVector(0,0,7);
    // console.log(a)
    cuboid(PVector.mult(a,6),b,c);
    cuboid(a,PVector.mult(b,6),c);
    cuboid(a,b,PVector.mult(c,6));
}

int Nframe = 150;

void draw() {
    background(255);
    // noStroke()
    stroke(255);
    strokeWeight(width*0.012);
    // fill(0)
    float F = frameCount % Nframe;
    float phase = (F/Nframe)*3.14159;
    float r = (1-cos(phase))/2;
    float d = 23 * pow(1.025,F);
    perspective(radians(130)/pow(1.025,F), 1.0, 1.0, d*2);
    camera(0, 0, d, 0,0,0, 0,1,0);
    rotateY(radians((540+35)*r));
    rotateX(radians((360+90+45)*r));
    riis();
    if ( frameCount < Nframe ){
      String fname = str(frameCount) + ".png";
      save(fname);
    }
}
