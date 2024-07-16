uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

attribute vec3 position;

void main() {
  gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0); 
  }

/********** uniform mat4 projectionMatrix;
- declares a uniform variable named projectionMatrix of type mat4 (4x4 matrix)

- Uniforms are global variables that are set by the host application (in this case, your JavaScript code using THREE.js) and remain constant for all vertices processed by the shader.

- The "projectionMatrix" is used to transform vertex coordinates from camera (view) space to clip space.  we're discussing the process of converting the positions of vertecies in a 3D scene so they can be correctly displayed on a 2D screen.

- "Clip space" is a coordinate system that helps the computer figure out what parts of the 3D scene will actually be visible on the screen.

After transforming to clip space, coordinates are then used to determine what can be seen in the final image and what gets cut off (or clipped).

Think of it as the area that the camera can see, bounded by the edges of the screen.

** This line says that there is a matrix called projectionMatrix that our shader will use. Think of it as a special formula that helps turn our 3D scene into a 2D picture on the screen. This formula doesn't change while drawing one frame.


********** uniform mat4 viewMatrix;
- The viewMatrix is used to transform vertex coordinates from world space to camera (view) space. It represents the camera's position and orientation in the scene.

** This one helps adjust the scene based on where our camera is and where it's looking. It's like moving the entire scene around so that the camera can see it from a particular angle. 


********** uniform mat4 modelMatrix;
- The modelMatrix transforms vertex coordinates from object (model) space to world space. It represents the object's position, rotation, and scale in the scene.

** This matrix is used to move, rotate, or scale the object in the scene. It's like deciding where to place a toy on a table, how to turn it, and how big or small it should be.


********* attribute vec3 position;
- Attributes are per-vertex data passed from the host application to the vertex shader. Each vertex processed by the shader has its own position value.

- The position attribute represents the vertex's coordinates in object (model) space.

** This line says each vertex (point) of our 3D object has a position with three coordinates (x, y, z). Each vertex has its own position. Think of it as each corner of a box having its own place in space.


************ void main()
- This is the entry point of the vertex shader. Every vertex processed by the shader runs this function.

- The main function has no return value (denoted by void).

- This starts the main part of our shader program. It’s like the beginning of a recipe where we start giving instructions.

******* vec4(position, 1.0)
- This converts our 3D position into a 4D vector (we add an extra number, 1.0, to it). This is just a step we need to take to use the matrix math that follows.

******* modelMatrix * vec4(position, 1.0)
- First, we move, rotate, or scale our vertex using the model matrix. It’s like placing and adjusting our toy in the right spot on the table.

****** viewMatrix * (modelMatrix * vec4(position, 1.0))
- Next, we adjust everything based on where the camera is. It’s like moving the table so the camera can see the toy from the right angle.

****** projectionMatrix * (viewMatrix * (modelMatrix * vec4(position, 1.0)))
- Finally, we use the projection matrix to flatten our 3D scene into a 2D picture, so it can be shown on the screen.

****** gl_Position: 
- This is a built-in GLSL variable that holds the "final position" of the vertex in clip space. The GPU uses gl_Position to determine where to draw the vertex on the screen.



************* 
  vec2 foo = vec2(1.0, 2.0);
  foo *= 2.0;
  
  vec3 bar = vec3(0.0);
  vec3 fooBar = vec3(1.0, 2.0, 3.0);
  fooBar *= 4.0;

  vec3 purpleColor = vec3(0.0);
  purpleColor.r = 0.5;
  purpleColor.b = 1.0;

  vec2 foot = vec2(1.0, 2.0);
  vec3 ball = vec3(foot, 3.0);

  vec3 air = vec3(1.0, 2.0, 3.0);
  vec2 craft = air.zy; // swizzle: order can be different

  vec4 hand = vec4(1.0, 2.0, 3.0, 4.0);
  float eye = hand.z;         // hand.w; 
                              // hand.a;  as "alpha"



  //============= Function
  float loremIpsum() {
    float a = 1.0;
    float b = 2.0;

    return a * b;
  }

  void main() {
    float result = loremIpsum();

    gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0); 
  }

  OR

  float loremIpsum(float a, float b) {
    return a + b;
  }

  void main() {
    float result = loremIpsum(1.0, 2.0);
  }


** Native function
  GLSL has many built-in classic functions such as sin, cos, max, min, pow, exp, mod, clamp, 
  but also very practical functions like "cross", "dot", "mix", "step", "smoothstep", "length", "distance", "reflect", "refract", "normalize".
*/