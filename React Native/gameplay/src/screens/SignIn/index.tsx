import React, { useState } from "react";
import { View, Text, Image, StatusBar, Button } from "react-native";
import { styles } from "./styles";
import { ButtonIcon } from "../../components/ButtonIcon";

import DiscordPng from '../../assets/discord.png';
import IllustrationImg from '../../assets/illustration.png';

export default function SignIn() {
    return (
        <View style={styles.container}>
            <StatusBar barStyle="light-content" backgroundColor="transparent" translucent />
            <Image source={IllustrationImg} style={styles.image} resizeMode="stretch" />
            <View style={styles.content}>
                <Text style={styles.mainText}>Conecte-se e organize suas jogatinas</Text>
                <Text style={styles.secondaryText}>Crie grupos para jogar seus games favoritos com seus amigos</Text>
                <ButtonIcon title="Entrar com Discord" image={DiscordPng} />
            </View>
        </View>
    );
}