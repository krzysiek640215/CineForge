package com.cineforge.studio
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.foundation.layout.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.VideoLibrary
import androidx.compose.foundation.background
import androidx.compose.ui.Alignment
import androidx.compose.ui.unit.dp

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme(colorScheme = darkColorScheme()) {
                var clips by remember { mutableStateOf(0) }
                Scaffold(topBar = { TopAppBar(title = { Text("CineForge Studio") }) }) { pad ->
                    Column(Modifier.padding(pad).fillMaxSize().background(Color.Black), horizontalAlignment = Alignment.CenterHorizontally, verticalArrangement = Arrangement.Center) {
                        androidx.compose.material3.Icon(Icons.Default.VideoLibrary, null, tint = Color.Gray, modifier = Modifier.size(64.dp))
                        Text("CineForge dziala! Klipy: $clips", color = Color.White)
                        Button(onClick = { clips++ }) { Text("Dodaj klip") }
                    }
                }
            }
        }
    }
}