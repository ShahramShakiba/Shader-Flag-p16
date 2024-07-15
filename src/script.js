import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';
import GUI from 'lil-gui';

const canvas = document.querySelector('canvas.webgl');
const gui = new GUI();
const scene = new THREE.Scene();

let width = window.innerWidth;
let height = window.innerHeight;

//=================== Textures ======================
const textureLoader = new THREE.TextureLoader();

//================== Objects ========================
const geometry = new THREE.PlaneGeometry(1, 1, 32, 32);
const material = new THREE.RawShaderMaterial({
  vertexShader: `
    
  `,
  fragmentShaderL: `
  
  `,
});
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

  controls.update();
  renderer.render(scene, camera);
  window.requestAnimationFrame(tick);
};

tick();
