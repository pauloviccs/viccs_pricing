const fs = require('fs');
const path = require('path');

const indexPath = path.join(__dirname, 'index.html');
let indexHtml = fs.readFileSync(indexPath, 'utf8');

// 1. Replace the black logo with the PNG base64
const pngPath = path.join(__dirname, '.agent/media/png/2x/viccs_logo_black@2x.png');
const pngBase64 = fs.readFileSync(pngPath).toString('base64');
const newBlackLogoUri = `data:image/png;base64,${pngBase64}`;

// Find the line with viccsLogoBase64 = "data:image/svg+xml;base64,..." and replace it
indexHtml = indexHtml.replace(/const viccsLogoBase64 = "data:image\/svg\+xml;base64,[^"]+";/, `const viccsLogoBase64 = "${newBlackLogoUri}";`);

// Change the img tag width in the PDF template so the PNG fits nicely
// The original was likely 200px or so.
indexHtml = indexHtml.replace(/<img src=\{viccsLogoBase64\} alt="VICCS Logo" className="h-10 mb-4" \/>/, `<img src={viccsLogoBase64} alt="VICCS Logo" className="h-12 object-contain mb-4" />`);


// 2. Add "Plotagem" to the "impressao" category.
// We need to find the BASE_SERVICES array
// It looks like: { id: 'impressao_banner', category: 'impressao', name: 'Banner/Lona (por m²)', ... }
const plotagemService = `  { id: 'impressao_plotagem', category: 'impressao', name: 'Plotagem', basePrice: 0, description: 'Plotagem sob medida' },\n`;
if (!indexHtml.includes("impressao_plotagem")) {
    indexHtml = indexHtml.replace(
        /(id:\s*'impressao_faixa'.*?,)/,
        `$1\n${plotagemService}`
    );
}

// 3. Replace "VICCS Pricing" text with white logo SVG
const whiteSvgPath = path.join(__dirname, '.agent/media/svg/viccs_logo_white.svg');
const whiteSvgBase64 = fs.readFileSync(whiteSvgPath).toString('base64');
const newWhiteLogoUri = `data:image/svg+xml;base64,${whiteSvgBase64}`;

// In Header:
// <h1 className="text-xl font-bold tracking-wider">VICCS Pricing</h1>
const headerReplacement = `
            <div 
              onContextMenu={(e) => e.preventDefault()} 
              className="flex items-center select-none"
            >
              <img 
                src="${newWhiteLogoUri}" 
                alt="VICCS Logo" 
                className="h-8 object-contain pointer-events-none" 
                draggable={false} 
              />
            </div>
`;
indexHtml = indexHtml.replace(/<h1 className="text-xl font-bold tracking-wider">VICCS Pricing<\/h1>/, headerReplacement.trim());

fs.writeFileSync(indexPath, indexHtml);
console.log("Updated index.html successfully!");
