function setup() {
    createCanvas(500, 500, WEBGL);
    angleMode(DEGREES)
    frameRate(30)
}



function myquad(a,b,c,d){
    beginShape();
    vertex(a.x, a.y, a.z)
    vertex(b.x, b.y, b.z)
    vertex(c.x, c.y, c.z)
    vertex(d.x, d.y, d.z)
    vertex(a.x, a.y, a.z)
    endShape(CLOSE);
}

function cuboid(a,b,c){
    let ah = a.copy()
    let bh = b.copy()
    let ch = c.copy()
    ah.div(-2)
    bh.div(-2)
    ch.div(-2)
    ah.add(bh).add(ch)
    push()
    translate(ah)
    let zero=createVector(0,0,0)
    let ab = p5.Vector.add(a,b)
    let bc = p5.Vector.add(b,c)
    let ca = p5.Vector.add(c,a)
    fill(255)
    myquad(zero, a, ab, b)
    myquad(c, ca, p5.Vector.add(ca,b), bc)
    fill(0,125,198)
    myquad(zero, b, bc, c)
    myquad(a, ab, p5.Vector.add(ab,c), ca)
    fill(49,57,148)
    myquad(zero, c, ca, a)
    myquad(b, bc, p5.Vector.add(bc,a), ab)
    pop()
}

function riis(){
    let a = createVector(7,0,0);
    let b = createVector(0,7,0);
    let c = createVector(0,0,7);
    // console.log(a)
    cuboid(p5.Vector.mult(a,6),b,c)
    cuboid(a,p5.Vector.mult(b,6),c)
    cuboid(a,b,p5.Vector.mult(c,6))
}


function draw() {
    background(255);
    // noStroke()
    stroke(255)
    strokeWeight(8)
    // fill(0)
    let F = frameCount % 150
    let r = (1-cos((F/150)*180))/2
    let d = 23 * 1.03**F;
    perspective(130/1.03**F, 1.0, 1.0, d*2)
    camera(0, 0, d, 0,0,0, 0,1,0)
    rotateY((540+35)*r);
    rotateX((360+90+45)*r);
    riis()
}