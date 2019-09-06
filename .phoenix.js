Phoenix.set({
    daemon: true,
    openAtLogin: true
});

const mAlt = ['alt'];
const mNudge = ['shift', 'ctrl', 'alt'];
const mHyper = ['cmd', 'ctrl', 'alt'];

const chrome = 'Google Chrome';
const firefox = 'Firefox';
const editor = 'Sublime Text Dev';
const calendar = 'Fantastical 2';
const activityMonitor = 'Activity Monitor';
const finder = 'Finder';
const imsg = 'Messages';
const safari = 'Safari';
const kkbox = 'KKBOX';
const spotify = 'Spotify';
const itunes = 'iTunes';
const ptt = 'Welly';
const line = 'LINE';

const percentage = 0.05

Key.on('left', mNudge, () => {
  var currentWindow = Window.focused();
  var currentScreen = currentWindow.screen();
  var fullFrame = currentScreen.flippedVisibleFrame();

  currentWindow.setFrame({ x: 0, y: 0, width: fullFrame.width/2, height: fullFrame.height });
});

Key.on('right', mNudge, () => {
  var currentWindow = Window.focused();
  var currentScreen = currentWindow.screen();
  var fullFrame = currentScreen.flippedVisibleFrame();

  currentWindow.setFrame({ x: fullFrame.width/2, y: 0, width: fullFrame.width/2, height: fullFrame.height });
});

Key.on('up', mNudge, () => {
  var currentWindow = Window.focused();
  var currentScreen = currentWindow.screen();
  var fullFrame = currentScreen.flippedVisibleFrame();

  currentWindow.setFrame({ x: 0, y: 0, width: fullFrame.width, height: fullFrame.height/2 });
});

Key.on('down', mNudge, () => {
  var currentWindow = Window.focused();
  var currentScreen = currentWindow.screen();
  var fullFrame = currentScreen.flippedVisibleFrame();

  currentWindow.setFrame({ x: 0, y: fullFrame.height/2, width: fullFrame.width, height: fullFrame.height/2 });
});

Key.on('f9', mNudge, () => {
  var currentWindow = Window.focused();
  var currentScreen = currentWindow.screen();
  var fullFrame = currentScreen.flippedVisibleFrame();
  var sizeM = currentWindow.size();

  currentWindow.setFrame({ x: 0, y: 0, width: sizeM.width, height: fullFrame.height });
});

Key.on('f10', mNudge, () => {
  var currentWindow = Window.focused();
  var currentScreen = currentWindow.screen();
  var fullFrame = currentScreen.flippedVisibleFrame();
  var sizeM = currentWindow.size();

  currentWindow.setFrame({ x: fullFrame.width - sizeM.width, y: 0, width: sizeM.width, height: fullFrame.height });
});

Key.on('f11', mNudge, () => {
  var currentWindow = Window.focused();
  var currentScreen = currentWindow.screen();
  var fullFrame = currentScreen.flippedVisibleFrame();

  currentWindow.setFrame({ x: 0, y: 0, width: fullFrame.width/2, height: fullFrame.height });
});

Key.on('f12', mNudge, () => {
  var currentWindow = Window.focused();
  var currentScreen = currentWindow.screen();
  var fullFrame = currentScreen.flippedVisibleFrame();

  currentWindow.setFrame({ x: fullFrame.width/2, y: 0, width: fullFrame.width/2, height: fullFrame.height });
});

Key.on('end', mNudge, () => {
  var currentWindow = Window.focused();
  var currentScreen = currentWindow.screen();
  var fullFrame = currentScreen.flippedVisibleFrame();

  currentWindow.setFrame({ x: fullFrame.width * 1/6, y: 0, width: fullFrame.width* 3/5, height: fullFrame.height });
});

Key.on('h', mNudge, () => {
  var currentWindow = Window.focused(),
    currentSize = currentWindow.size(),
    currentScreenRect = currentWindow.screen().visibleFrame();

  currentWindow.setSize({ width: currentSize.width - currentScreenRect.width * percentage, height: currentSize.height });
});

Key.on('h', mHyper, () => {
  var currentWindow = Window.focused(),
    currentPoint = currentWindow.topLeft(),
    currentScreenRect = currentWindow.screen().visibleFrame();

  currentWindow.setTopLeft({ x: currentPoint.x - currentScreenRect.width * percentage, y: currentPoint.y });
});

Key.on('l', mNudge, () => {
  var currentWindow = Window.focused(),
    currentSize = currentWindow.size(),
    currentScreenRect = currentWindow.screen().visibleFrame();

  currentWindow.setSize({ width: currentSize.width + currentScreenRect.width * percentage, height: currentSize.height });
});

Key.on('l', mHyper, () => {
  var currentWindow = Window.focused(),
    currentPoint = currentWindow.topLeft(),
    currentScreenRect = currentWindow.screen().visibleFrame();

  currentWindow.setTopLeft({ x: currentPoint.x + currentScreenRect.width * percentage, y: currentPoint.y });
});

Key.on('k', mNudge, () => {
  var currentWindow = Window.focused(),
    currentSize = currentWindow.size(),
    currentScreenRect = currentWindow.screen().visibleFrame();

  currentWindow.setSize({ width: currentSize.width, height: currentSize.height - currentScreenRect.height * percentage });
});

Key.on('k', mHyper, () => {
  var currentWindow = Window.focused(),
    currentPoint = currentWindow.topLeft(),
    currentScreenRect = currentWindow.screen().visibleFrame();

  currentWindow.setTopLeft({ x: currentPoint.x, y: currentPoint.y - currentScreenRect.height * percentage });
});

Key.on('j', mNudge, () => {
  var currentWindow = Window.focused(),
    currentSize = currentWindow.size(),
    currentScreenRect = currentWindow.screen().visibleFrame();

  currentWindow.setSize({ width: currentSize.width, height: currentSize.height + currentScreenRect.height * percentage });
});

Key.on('j', mHyper, () => {
  var currentWindow = Window.focused(),
    currentPoint = currentWindow.topLeft(),
    currentScreenRect = currentWindow.screen().visibleFrame();

  currentWindow.setTopLeft({ x: currentPoint.x, y: currentPoint.y + currentScreenRect.height * percentage });
});

const previousFrames = {};

Key.on('space', mAlt, () => {
  var currentWindow = Window.focused();
  var title = currentWindow.title();
  var currentScreen = currentWindow.screen();
  var fullFrame = currentScreen.flippedVisibleFrame();
  var isMaximized = currentWindow.size().width === fullFrame.width && currentWindow.size().height === fullFrame.height;

  if (isMaximized && previousFrames[currentWindow]) {
    currentWindow.setFrame(previousFrames[currentWindow]);
    delete previousFrames[currentWindow];

  } else if (!isMaximized) {
    previousFrames[currentWindow] = currentWindow.frame();
    currentWindow.maximize();
  } else {
    currentWindow.setFrame({
      x: fullFrame.width * 1/2 * Math.random(),
      y: fullFrame.width * 1/3 * Math.random(),
      width: fullFrame.width * 3/5,
      height: fullFrame.height * 3/5,
    });

  }
});

Key.on("'", mAlt, () => {
  App.launch(chrome).focus();
});

Key.on("]", mAlt, () => {
  App.launch(editor).focus();
});

Key.on('c', mAlt, () => {
  App.launch(calendar).focus();
});

Key.on('a', mAlt, () => {
  App.launch(activityMonitor).focus();
});

Key.on('m', mAlt, () => {
  App.launch(imsg).focus();
});

Key.on('s', mAlt, () => {
  App.launch(chrome).focus();
});

Key.on('/', mAlt, () => {
  App.launch(spotify).focus();
});
