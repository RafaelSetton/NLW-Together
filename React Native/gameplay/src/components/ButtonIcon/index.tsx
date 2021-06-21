import React from "react";
import { Text, Image, View, TouchableOpacity, ImageSourcePropType } from "react-native";
import { styles } from "./styles";

interface Props {
    title: string,
    image: ImageSourcePropType,
}

export function ButtonIcon({ title, image }: Props) {
    return (
        <TouchableOpacity style={styles.container} activeOpacity={0.4}>
            <View style={styles.iconWrapper}>
                <Image source={image} />
            </View>
            <Text style={styles.title}>
                {title}
            </Text>
        </TouchableOpacity>
    )
}