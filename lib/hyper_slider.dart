import 'package:flutter/material.dart';
import 'package:sizing/sizing.dart';

class hyperSlider extends StatefulWidget {
  final List<String> imageUrls;
  final List<String> localImagesPath;
  final List<String> imageLabels;
  final Function(int) onChanged; // Callback for index changes
  final Color? sliderContainerBackground; // Color for the slider container
  final Color? textColor; // Color for the text label
  final Color? primaryColor; // Primary color
  final Color? secondaryColor; // Secondary color
  final Color? accentColor; // Accent color
  final Color? backgroundColor; // Background color
  final double? radius;

  const hyperSlider({
    super.key,
    required this.imageUrls,
    required this.imageLabels,
    required this.onChanged,
    this.sliderContainerBackground = ColorPalette.background,
    this.textColor = ColorPalette.accent,
    this.primaryColor = ColorPalette.primary,
    this.secondaryColor = ColorPalette.secondary,
    this.accentColor = ColorPalette.accent,
    this.backgroundColor = ColorPalette.background,
    this.radius,
    required this.localImagesPath,
  });

  @override
  _hyperSliderState createState() => _hyperSliderState();
}

class _hyperSliderState extends State<hyperSlider> {
  double sliderValue = 0.5; // Slider starts at the center (range 0 to 1)

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // Decide which list to use: imageUrls or localImagesPath
    final List<String> imagesToUse = widget.imageUrls.isNotEmpty ? widget.imageUrls : widget.localImagesPath;

    final double cardWidth = (screenWidth - (25 * screenWidth / 320) * (imagesToUse.length + 1)) / imagesToUse.length;

    return SizingBuilder(
        builder: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ListView for Images
                SizedBox(
                  height: 200.0.ss.f(0.5),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 20.0.ss.f(0.5)),
                    scrollDirection: Axis.horizontal,
                    itemCount: imagesToUse.length,
                    itemBuilder: (context, index) {
                      final isSelected = (sliderValue * (imagesToUse.length - 1)).round() == index;

                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AnimatedOpacity(
                                opacity: isSelected ? 1.0 : 0.5,
                                duration: const Duration(milliseconds: 300),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: isSelected ? cardWidth * 2 : cardWidth,
                                  height: isSelected ? 150.0.ss.f(0.5) : 100.0.ss.f(0.5),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imagesToUse == widget.imageUrls ? NetworkImage(imagesToUse[index]) : AssetImage(imagesToUse[index]) as ImageProvider, // Local image if from localImagesPath
                                    ),
                                  ),
                                ),
                              ),
                              if (isSelected)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    widget.imageLabels[index],
                                    style: TextStyle(
                                      color: widget.textColor ?? ColorPalette.accent,
                                      fontSize: 12.0.ss.f(0.5),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const Spacer(),

                // Slider at the Bottom
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 300.0.ss.f(0.5),
                    height: 50.0.ss.f(0.5),
                    decoration: BoxDecoration(
                      color: widget.sliderContainerBackground ?? ColorPalette.text,
                      borderRadius: BorderRadius.circular(widget.radius ?? 12.0),
                    ),
                    child: Slider(
                      value: sliderValue,
                      thumbColor: widget.primaryColor ?? ColorPalette.primary,
                      activeColor: widget.primaryColor ?? ColorPalette.primary,
                      inactiveColor: widget.secondaryColor ?? ColorPalette.secondary,
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value;
                          final selectedIndex = (sliderValue * (imagesToUse.length - 1)).round();
                          widget.onChanged(selectedIndex);
                        });
                      },
                      min: 0,
                      max: 1,
                    ),
                  ),
                ),
              ],
            ));
  }
}

class ColorPalette {
  static const Color text = Color(0xFF0C0B10); // --texto: #0c0b10
  static const Color background = Color(0xFFF4F4F7); // --fundo: #f4f4f7
  static const Color primary = Color(0xFF7E769F); // --primário: #7e769f
  static const Color secondary = Color(0xFFC1B2A6); // --secundário: #c1b2a6
  static const Color accent = Color(0xFFA6AF8C); // --acento: #a6af8c
  static const Color red = Color(0xFFfc6a96); //
}
