// Kitty Cursor Trail Effect for Ghostty
// Mimics Kitty's distinctive cursor trail with smooth decay and configurable parameters

// -- CONFIGURATION --
vec4 TRAIL_COLOR = iCurrentCursorColor; // Can change to custom color, e.g.: vec4(0.2, 0.6, 1.0, 0.5);
const float DECAY_RATE = 0.1; // Controls how quickly trail fades (lower = longer trail)
const float TRAIL_LENGTH = 0.4; // Maximum trail length as fraction of cursor width
const float START_THRESHOLD = 2.0; // Distance threshold to start trail (in cursor widths)
const float TRAIL_OPACITY = 0.6; // Overall trail opacity
const float BLUR_SIZE = 1.5; // Blur size in pixels for antialiasing

// --- EASING FUNCTIONS ---
const float PI = 3.14159265359;

// Exponential decay for smooth trail fade
float decayEase(float x) {
    return exp(-DECAY_RATE * x);
}

// Smooth step for threshold-based trail activation
float trailThreshold(float distance, float threshold) {
    return smoothstep(threshold * 0.5, threshold * 1.5, distance);
}

// --- DISTANCE FUNCTIONS ---

float getSdfRectangle(in vec2 p, in vec2 xy, in vec2 b) {
    vec2 d = abs(p - xy) - b;
    return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
}

float getSdfParallelogram(in vec2 p, in vec2 v0, in vec2 v1, in vec2 v2, in vec2 v3) {
    float s = 1.0;
    float d = dot(p - v0, p - v0);

    // Simplified segment distance calculation
    vec2 e = v3 - v0;
    vec2 w = p - v0;
    vec2 proj = v0 + e * clamp(dot(w, e) / dot(e, e), 0.0, 1.0);
    d = min(d, dot(p - proj, p - proj));

    return s * sqrt(d);
}

// --- UTILITY FUNCTIONS ---

vec2 normalizeCoords(vec2 value, float isPosition) {
    return (value * 2.0 - (iResolution.xy * isPosition)) / iResolution.y;
}

float antialias(float distance) {
    return 1.0 - smoothstep(0.0, normalizeCoords(vec2(BLUR_SIZE, BLUR_SIZE), 0.0).x, distance);
}

// --- MAIN TRAIL LOGIC ---

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    #if !defined(WEB)
    fragColor = texture(iChannel0, fragCoord.xy / iResolution.xy);
    #endif

    // Normalize coordinates to -1 to 1 range
    vec2 vu = normalizeCoords(fragCoord, 1.0);
    vec2 offsetFactor = vec2(-0.5, 0.5);

    // Current and previous cursor positions
    vec4 currentCursor = vec4(normalizeCoords(iCurrentCursor.xy, 1.0), normalizeCoords(iCurrentCursor.zw, 0.0));
    vec4 previousCursor = vec4(normalizeCoords(iPreviousCursor.xy, 1.0), normalizeCoords(iPreviousCursor.zw, 0.0));

    // Calculate movement delta
    vec2 currentCenter = currentCursor.xy - (currentCursor.zw * offsetFactor);
    vec2 previousCenter = previousCursor.xy - (previousCursor.zw * offsetFactor);
    vec2 delta = currentCenter - previousCenter;
    float distance = length(delta);

    // Base cursor rendering
    float sdfCursor = getSdfRectangle(vu, currentCenter, currentCursor.zw * 0.5);
    vec4 outputColor = fragColor;

    // Trail activation logic
    float trailActive = trailThreshold(distance, START_THRESHOLD);
    if (distance > START_THRESHOLD * currentCursor.w) {
        // Calculate trail progress based on time and decay
        float timeSinceMove = iTime - iTimeCursorChange;
        float trailProgress = decayEase(timeSinceMove * DECAY_RATE);

        // Determine trail direction and orientation
        float isHorizontal = step(abs(delta.y), abs(delta.x));
        float isVertical = 1.0 - isHorizontal;

        // Calculate trail endpoints
        vec2 head = mix(previousCenter, currentCenter, trailProgress);
        vec2 tail = previousCenter;

        // Create trail geometry based on movement direction
        vec2 trailSize = vec2(currentCursor.z, currentCursor.w) * TRAIL_LENGTH;
        vec2 trailCenter = mix(tail, head, 0.5);
        vec2 trailBoxSize = (trailSize + currentCursor.zw) * 0.5;

        // Calculate trail SDF
        float sdfTrail = getSdfRectangle(vu, trailCenter, trailBoxSize);

        // Apply trail with proper opacity and antialiasing
        vec4 trailColor = TRAIL_COLOR * TRAIL_OPACITY * trailActive;
        float trailAlpha = antialias(sdfTrail) * trailActive;
        outputColor = mix(outputColor, trailColor, trailAlpha);

        // Punch hole for current cursor
        outputColor = mix(outputColor, fragColor, step(sdfCursor, 0.0));
    }

    fragColor = outputColor;
}