precision mediump float;

uniform vec3 uColor;
uniform sampler2D uTexture;

varying vec2 varyingUv;
varying float vElevation;

void main() {
  // Sample the texture at the given UV coordinates
  vec4 textureColor = texture2D(uTexture, varyingUv);
  textureColor.rgb *= vElevation + 0.6;

  gl_FragColor = textureColor;
}



/**
**--> precision mediump float; <---

*? This line sets the default precision for floating-point variables to mediump (medium precision). 
This is important in environments where precision can affect performance and quality, such as mobile devices.

- How percise a float can be :
  1. highp: can have performance hit and might not work on some devices
  2. mediump: we usually use this 
  3. lowp: can create bugs by the lack of precision



**---> gl_FragColor = vec4(1.0, 0.6, 0.0, 1.0); <---

*? gl_FragColor is a built-in variable that specifies the color of the pixel. It is a vec4 (a 4-component vector) where each component represents the red, green, blue, and alpha (transparency) channels, respectively.


** Summary
This fragment shader is a simple program that sets every pixel it processes to an orange color. 
The use of medium precision for floating-point calculations ensures a balance between performance and accuracy, suitable for many applications, especially on mobile platforms.


**--> sampler2D <---
- is the type for the textures



**--> texture2D() <---
-  returns a vec4
-  Most textures store color information in four channels: red, green, blue, and alpha. These four channels are often represented as a vec4 in GLSL.
*/