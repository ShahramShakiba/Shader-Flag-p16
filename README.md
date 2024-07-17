  # <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Telegram-Animated-Emojis/main/Objects/Laptop.webp" alt="Laptop" width="35" /> &nbsp; _Shaders | Waving Flag_ &nbsp; <img src="https://skillicons.dev/icons?i=threejs" height="35" alt="threejs logo"  />  

<!----------------------------------------- Description ---------------------------------------->
### <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Symbols/Bubbles.png" alt="Bubbles" width="40" height="40" />&nbsp; _Description_

> To begin with, it is important to note that, this project have been sourced from an exceptional `Three.js Journey` Course. <br/>
 
### 👤 Instructed by a _proficient_ and _expert educator_ <a href="https://threejs-journey.com/" target="_blank"> _"Bruno Simon"_ </a>. 

 <br/>

## What is a Shader
A shader is a program written in GLSL (OpenGL Shading Language) that runs on the GPU (Graphics Processing Unit) to determine how 3D objects are rendered on the screen. <br/> Shaders are essential for defining the visual appearance of objects in a 3D scene, including their color, lighting, texture, and special effects.

#### Simple Explanation :
Shaders in Three.js are like special effects artists in a movie. Just like an artist adds visual effects to make a movie scene look amazing, shaders enhance the graphics in a 3D scene to make it look more realistic or artistic. They do this by manipulating how objects look when they are drawn on the screen. <br/><br/>

#### We send a lot of data to the shader :
  - Vertices coordinates
  - Mesh transformation
  - Information about the camera
  - Colors
  - Textures
  - Lights
  - Fog
  - Etc

<br/>

## Two types of shaders
> ### _1. Vertex Shaders_ 
_Define the position of each vertex (point) in 3D space. They shape the geometry of objects._
  - _`Function :`_ <br/> Transform 3D coordinates to 2D screen coordinates, manage vertex positions, and pass data to the fragment shader.
  - _`Example :`_ <br/> Adjusting the position of vertices to animate a waving flag.
  - _`Real-Life Analogy :`_ <br/> Imagine you're designing a sculpture. The vertex shader is like the sculptor who shapes the clay into a specific form, deciding where each part of the sculpture should be.
  
#### _vertex.glsl :_
 ``` glsl
  uniform mat4 modelMatrix;   // apply transformations relative to the Mesh (position, rotation, scale).
  uniform mat4 viewMatrix;   // apply transformations relative to the Camera (position, rotation, fov, near, far).
  uniform mat4 projectionMatrix;   // transform the coordinates into the Clip Space coordinates.

  attribute vec3 position;

  void main() {
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectionPosition = projectionMatrix * viewPosition;

    gl_Position = projectionPosition;
  }
  ```

  <br/> <br/> 
    
> ### _2. Fragment Shaders_ 
_Define the color and texture of each pixel on the object. They handle the details of how an object looks._
  - _`Function :`_ <br/> Determine the final color of pixels, handle lighting calculations, apply textures, and create visual effects.
  - _`Example :`_ <br/> Making a surface look shiny and reflective, like a metal.
  - _`Real-Life Analogy :`_ <br/> Once the sculpture is shaped, the fragment shader is like the painter who adds color, texture, and details to the sculpture to make it look realistic or stylized.

#### _fragment.glsl :_
 ``` glsl
  precision mediump float;   // sets the default precision for floating-point variables.

  void main() {
    gl_FragColor = vec4(1.0, 0.6, 0.0, 1.0);   // specifies the color of the pixel.
  }
 ```

<br/> <br/> 
<hr>

> ### _Attributes_
Attributes are variables that hold data specific to each vertex in a 3D model. These variables change from vertex to vertex. <br/> 
  - Attributes could be the position of each vertex, its color, or its texture coordinates.
  - _Analogy_ : <br/> When rendering a 3D model of a tree, each vertex might have attributes for its position in 3D space, its normal direction (for lighting calculations), and its UV coordinates (for applying textures).


> ### _Uniforms_
Uniforms are variables in shaders that remain constant for all vertices and pixels during a single rendering pass. <br/>
  - Uniforms could be the light direction, the color of a light source, or the current time for animations. 
  - _Analogy_ : <br/> Uniforms are like the oven temperature or cooking time in a recipe—these values are the same for the entire batch of cookies (all vertices and fragments).

> ### _Varyings_
Varyings are variables used to pass data from the "vertex" shader to the "fragment" shader. These values are interpolated, meaning they are smoothly transitioned between vertices across the surface of a polygon. <br/>
  - Varyings are used for data that needs to be shared between vertex and fragment shaders, such as interpolated colors or texture coordinates.
  - _Analogy_ : <br/> Varyings are like the sauce that is spread across the pizza. You apply the sauce at a few key vertices (points), and it gets spread out evenly across the whole pizza (interpolated across fragments).



<br/> <br/> 

> ### What is GLSL?
GLSL (OpenGL Shading Language) is the programming language used to write shaders. It is designed to run on the GPU and allows fine control over the graphics pipeline. It's close to C language.

#### GLSL Syntax and Features
1. C-like Syntax :
   - GLSL is syntactically similar to the C programming language, making it familiar to many developers.
   - Supports data types such as int, float, vec2, vec3, vec4, mat2, mat3, mat4, etc.

2. Built-in Functions :
   - Provides a rich set of built-in functions for mathematical operations, texture sampling, geometric calculations, and more.
   - Examples include sin(), cos(), normalize(), dot(), cross(), texture(), etc.

3. Precision Qualifiers :
   - Allows specifying the precision of floating-point calculations.
   - Common qualifiers include highp, mediump, and lowp.

<br/><br/> 

> [!IMPORTANT]
> #### Benefits of Using Shaders
>> 1. Enhanced Visuals : <br/> Create realistic lighting, shadows, reflections, and textures.
>> 2. Performance Optimization : <br/> Offload heavy computations to the GPU, making rendering more efficient.
>> 3. Customization : <br/> Craft unique visual effects that are not possible with standard materials.
>> 4. Interactivity : <br/> Create dynamic effects that respond to user input or time, like animated water or glowing buttons.

<br/> 


<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Eyes.png" alt="Eyes" width="25" height="25" /> Feel free to delve into the code as it has been written in a straightforward manner for easy understanding.
<br/> <br/> <br/> 


<!-------- try it live -------->
#### _Try it out immediately, and if you enjoy it, please give me a star._ &nbsp; <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Travel%20and%20places/Glowing%20Star.png" alt="Glowing Star" width="25"  /> <a href="https://shader-waving-flag-shahram.netlify.app/" target="_blank"> &nbsp; _Shaders | Waving Flag_ </a> 


<!--------- Video --------->
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Telegram-Animated-Emojis/main/Objects/Clapper%20Board.webp" alt="Clapper Board" width="35" /> &nbsp; 

https://github.com/user-attachments/assets/5d38ae04-0373-4767-99dc-7bc7b28e90b7

  <br/> 

***

<!--======================= Social Media ===========================-->
 ## <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/People%20with%20professions/Man%20Detective%20Light%20Skin%20Tone.png" alt="Man Detective Light Skin Tone" width="65" /> Find me around the Web  
<a href="https://www.linkedin.com/in/shahramshakiba/" target="_blank">
    <img src="https://raw.githubusercontent.com/maurodesouza/profile-readme-generator/master/src/assets/icons/social/linkedin/default.svg" width="52" height="40" alt="linkedin logo"  />
  </a> &nbsp;&nbsp;&nbsp;
  <a href="https://t.me/ShahramShakibaa" target="_blank">
    <img src="https://raw.githubusercontent.com/maurodesouza/profile-readme-generator/master/src/assets/icons/social/telegram/default.svg" width="52" height="40" alt="telegram logo"  />
  </a> &nbsp;&nbsp;&nbsp;
  <a href="https://wa.me/message/LM2IMM3ABZ7ZM1" target="_blank">
    <img src="https://raw.githubusercontent.com/maurodesouza/profile-readme-generator/master/src/assets/icons/social/whatsapp/default.svg" width="52" height="40" alt="whatsapp logo"  />
  </a> &nbsp;&nbsp;&nbsp;
  <a href="https://instagram.com/shahram.shakibaa?igshid=MzNlNGNkZWQ4Mg==" target="_blank">
    <img src="https://raw.githubusercontent.com/maurodesouza/profile-readme-generator/master/src/assets/icons/social/instagram/default.svg" width="52" height="40" alt="instagram logo"  />
  </a> &nbsp;&nbsp;&nbsp;
  <a href="https://twitter.com/ShahramShakibaa" target="_blank">
    <img src="https://raw.githubusercontent.com/maurodesouza/profile-readme-generator/master/src/assets/icons/social/twitter/default.svg" width="52" height="40" alt="twitter logo"  />
  </a>
