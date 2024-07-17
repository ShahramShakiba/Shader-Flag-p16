uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat4 projectionMatrix;
uniform vec2 uFrequency;
uniform float uTime;

attribute vec3 position;
attribute vec2 uv;

// pass uv-coordinates to fragment
varying vec2 varyingUv;

void main() {
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
  modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) / 10.0;
  modelPosition.z += sin(modelPosition.y * uFrequency.y - uTime) / 15.0;

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectionPosition = projectionMatrix * viewPosition;

  gl_Position = projectionPosition;

  varyingUv = uv;
}



/**
---> uniform mat4 modelMatrix; <---
*? apply transformations relative to the Mesh (position, rotation, scale)

---> uniform mat4 viewMatrix; <---
*? apply transformations relative to the Camera (position, rotation, FOV, near, far)

---> uniform mat4 projectionMatrix; <---
*? transform the coordinates into the clip space coordinates


========================================================================
** **  uniform mat4 modelMatrix;

- The modelMatrix transforms vertex coordinates from object (model) space to world space. It represents the object's position, rotation, and scale in the scene.

*? This matrix is used to move, rotate, or scale the object in the scene. It's like deciding where to place a toy on a table, how to turn it, and how big or small it should be.


========================================================================
** ** uniform mat4 viewMatrix;

- The viewMatrix is used to transform vertex coordinates from world space to camera (view) space. It represents the camera's position and orientation in the scene.

*? This one helps adjust the scene based on where our camera is and where it's looking. It's like moving the entire scene around so that the camera can see it from a particular angle. 


========================================================================
** ** uniform mat4 projectionMatrix;

- declares a uniform variable named projectionMatrix of type mat4 (4x4 matrix)

- Uniforms are global variables that are set by the host application (in this case, your JavaScript code using THREE.js) and remain constant for all vertices processed by the shader.

- The "projectionMatrix" is used to transform vertex coordinates from camera (view) space to clip space.  we're discussing the process of converting the positions of vertecies in a 3D scene so they can be correctly displayed on a 2D screen.

- "Clip space" is a coordinate system that helps the computer figure out what parts of the 3D scene will actually be visible on the screen.

After transforming to clip space, coordinates are then used to determine what can be seen in the final image and what gets cut off (or clipped).

Think of it as the area that the camera can see, bounded by the edges of the screen.

*? This line says that there is a matrix called projectionMatrix that our shader will use. Think of it as a special formula that helps turn our 3D scene into a 2D picture on the screen. This formula doesn't change while drawing one frame.


========================================================================
---> attribute vec3 position; <---

- Attributes are per-vertex data passed from the host application to the vertex shader. Each vertex processed by the shader has its own position value.

- The position attribute represents the vertex's coordinates in object (model) space.

** This line says each vertex (point) of our 3D object has a position with three coordinates (x, y, z). Each vertex has its own position. Think of it as each corner of a box having its own place in space.


========================================================================
---> void main() <---

- This is the entry point of the vertex shader. Every vertex processed by the shader runs this function.

- The main function has no return value (denoted by void).

- This starts the main part of our shader program. It’s like the beginning of a recipe where we start giving instructions.

** vec4(position, 1.0)
- This converts our 3D position into a 4D vector (we add an extra number, 1.0, to it, as a fourth value (x, y, z, w)). 

- This is just a step we need to take to use the matrix math that follows.

- We convert a 3D position into a 4D vector in order to perform matrix operations that involve transformations such as _translation_, _rotation_, and _scaling_. 
In graphics programming, this is done using a technique called "homogeneous coordinates".

*? _Homogeneous coordinates_ are a system used in computer graphics to handle transformations with matrices more efficiently. Here's why we use them:

  1. Translation:
     - In 3D space, a translation (moving an object) can't be represented by a 3x3 matrix alone.
     - By using 4x4 matrices and 4D vectors, we can represent translation along with other transformations (scaling, rotation) in a single matrix.

  2. Combining Transformations:
     - Using 4D vectors and 4x4 matrices allows us to combine multiple transformations (like rotating and then moving an object) into one matrix multiplication.
     - This makes the calculations simpler and more efficient.



** step-1:  modelMatrix * vec4(position, 1.0)
- First, we move, rotate, or scale our vertex using the model matrix. It’s like placing and adjusting our toy in the right spot on the table.

** step-2:  viewMatrix * (modelMatrix * vec4(position, 1.0))
- Next, we adjust everything based on where the camera is. It’s like moving the table so the camera can see the toy from the right angle.

** step-3:  projectionMatrix * (viewMatrix * (modelMatrix * vec4(position, 1.0)))
- Finally, we use the projection matrix to flatten our 3D scene into a 2D picture, so it can be shown on the screen.


*? gl_Position: 
- This is a built-in GLSL variable that holds the "final position" of the vertex in clip space. The GPU uses gl_Position to determine where to draw the vertex on the screen.


========================================================================


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



  //==== Function
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


========================================================================
---> Shorter version <--

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

attribute vec3 position;

void main() {
  gl_Position = projectionMatrix * viewMatrix * vec4(position, 1.0); 
}


========================================================================
---> Seperate Each Matrix <--

uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat4 projectionMatrix;

attribute vec3 position;

void main() {
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectionPosition = projectionMatrix * viewPosition;

  gl_Position = projectionPosition;
}


========================================================================
---> Create random attribute <--

script.js:
const geometry = new THREE.PlaneGeometry(1, 1, 32, 32);

//===== Start waving
const count = geometry.attributes.position.count; // how many vertices
const randoms = new Float32Array(count);

for (let i = 0; i < count; i++) {
  randoms[i] = Math.random();
}

// console.log(randoms);

geometry.setAttribute('aRandom', new THREE.BufferAttribute(randoms, 1)); //ex1 ↓

// console.log(geometry);



vertex.js : 
attribute float aRandom;
// it's not vec3, it's float because we 1 value

varying float vRandom;


void main() {
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
  // modelPosition.z += sin(modelPosition.x * 10.0) / 10.0;
  modelPosition.z += aRandom * 0.1; 

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectionPosition = projectionMatrix * viewPosition;

  gl_Position = projectionPosition;

  vRandom = aRandom;
}


fragment.js : 
precision mediump float;

varying float vRandom;

void main() {
  gl_FragColor = vec4(vRandom * 0.2, vRandom, 0.0, 1.0);
}

*/