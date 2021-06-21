import { StyleSheet } from "react-native";
import { theme } from "../../global/styles/theme";

export const styles = StyleSheet.create({
    container: {
        backgroundColor: theme.colors.primary,
        width: '100%',
        height: 56,
        borderRadius: 8,
        flexDirection: 'row',
        alignItems: 'center',
    },
    iconWrapper: {
        width: '20%',
        height: '100%',

        alignItems: 'center',
        justifyContent: 'center',

        borderRightWidth: 1,
        borderRightColor: theme.colors.line,
    },
    title: {
        flex: 1,
        color: theme.colors.heading,
        fontSize: 15,
        textAlign: 'center',
    },
});