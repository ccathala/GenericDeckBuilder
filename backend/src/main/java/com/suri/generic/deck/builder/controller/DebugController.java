package com.suri.generic.deck.builder.controller;

import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
public class DebugController {

    private final ResourceLoader resourceLoader;

    public DebugController(ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
    }

    @GetMapping("/debug/static-resources")
    public Map<String, Object> debugStaticResources() {
        Map<String, Object> debug = new HashMap<>();
        
        try {
            // Vérifier si les ressources existent
            Resource indexHtml = resourceLoader.getResource("classpath:/static/index.html");
            Resource assetsDir = resourceLoader.getResource("classpath:/static/assets/");
            Resource cssFile = resourceLoader.getResource("classpath:/static/assets/index-CbiFZ2XG.css");
            Resource jsFile = resourceLoader.getResource("classpath:/static/assets/index-CwNziQKP.js");
            Resource oldJsFile = resourceLoader.getResource("classpath:/static/assets/index-DgPCT4Ld.js");
            
            debug.put("index.html exists", indexHtml.exists());
            debug.put("assets/ exists", assetsDir.exists());
            debug.put("index-CbiFZ2XG.css exists", cssFile.exists());
            debug.put("index-CwNziQKP.js exists", jsFile.exists());
            debug.put("index-DgPCT4Ld.js exists (old)", oldJsFile.exists());
            
            if (indexHtml.exists()) {
                debug.put("index.html size", indexHtml.getFile().length());
            }
            
        } catch (IOException e) {
            debug.put("error", e.getMessage());
        }
        
        return debug;
    }
}
