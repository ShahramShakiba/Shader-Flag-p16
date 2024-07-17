//===================================================
/* "It is not an actual project; therefore,
I rely on comments to assess the code." */
//===================================================
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';
import GUI from 'lil-gui';
import * as THREE from 'three';
import vertex from './shaders/test/vertex.glsl';
import fragment from './shaders/test/fragment.glsl';

const canvas = document.querySelector('canvas.webgl');
const gui = new GUI();
const scene = new THREE.Scene();

let width = window.innerWidth;
let height = window.innerHeight;

//=================== Textures ======================
const textureLoader = new THREE.TextureLoader();

//================== Objects ========================
const geometry = new THREE.PlaneGeometry(1, 1, 32, 32);

//=== Start waving
const count = geometry.attributes.position.count; // how many vertices
const randoms = new Float32Array(count);

for (let i = 0; i < count; i++) {
  randoms[i] = Math.random();
}

// console.log(randoms);

geometry.setAttribute('aRandom', new THREE.BufferAttribute(randoms, 1)); //ex1 ↓

// console.log(geometry);

//============= Material
const material = new THREE.RawShaderMaterial({
  vertexShader: vertex,
  fragmentShader: fragment,

  uniforms: {
    uFrequency: { value: new THREE.Vector2(10, 5) },
    uTime: { value: 0 },
  },
});

gui
  .add(material.uniforms.uFrequency.value, 'x', 0, 25, 0.01)
  .name('frequencyX');
gui
  .add(material.uniforms.uFrequency.value, 'y', 0, 25, 0.01)
  .name('frequencyY');

const mesh = new THREE.Mesh(geometry, material);
scene.add(mesh);

//===================== Camera =========================
const camera = new THREE.PerspectiveCamera(75, width / height, 0.1, 100);
camera.position.set(0.25, -0.25, 1);
scene.add(camera);

//================ Orbit Controls ======================
const controls = new OrbitControls(camera, canvas);
controls.enableDamping = true;

//==================== Renderer ========================
const renderer = new THREE.WebGLRenderer({
  canvas: canvas,
  antialias: true,
});
renderer.setSize(width, height);
renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

//================ Resize Listener ====================
window.addEventListener('resize', () => {
  width = window.innerWidth;
  height = window.innerHeight;

  camera.aspect = width / height;
  camera.updateProjectionMatrix();

  renderer.setSize(width, height);
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
});

//=================== Animate =======================
const clock = new THREE.Clock();

const tick = () => {
  const elapsedTime = clock.getElapsedTime();

  material.uniforms.uTime.value = elapsedTime ;

  controls.update();
  renderer.render(scene, camera);
  window.requestAnimationFrame(tick);
};

tick();

/*********** SyntaxError: Unexpected identifier 'mat4'
 * this error may occur when we want to import our .glsl files
 
 * Our project currently lacks the capability to properly process .glsl files. This issue arises because when our .glsl files are loaded, they are being treated as JavaScript files, which is incorrect. 
 
* We need to extract the content of the .glsl files as a string and assign this string to a variable, which will then be used to pass the content to the Material.
 
  There are two solutions to import glsl files: 
  1. vite-plugin-glsl    // Easier to use
  2.vite-plugin-glslify  // Standard

  handy in 3 situation:
    1. we want to split big shaders
    2. we want to reuse shader chunks
    3. we want to use external chunks made by other developers


 - install: npm i vite-plugin-glsl --save-dev
 - in vite.config.js :
      import glsl from 'vite-plugin-glsl';
      
      plugins: [
        glsl(), // Handle shader files
      ],
 */

/************ map, alphaMap, opacity, color, etc
 * they wont work on material and we need to write these features ourselves in vertex and fragment shaders */

/*********** ex 1 
 * for position we provide 3 (x, y, z) for itemSize, but now is one random value per vertex so it's just 1
 
 * aRandom : attribute random
 * uRandom : uniform random
 * vRandom : varying random  */
