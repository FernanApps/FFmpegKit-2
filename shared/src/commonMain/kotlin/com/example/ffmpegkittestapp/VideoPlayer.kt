package com.example.ffmpegkittestapp

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier

@Composable
internal expect fun VideoPlayer(modifier: Modifier, url: String)
