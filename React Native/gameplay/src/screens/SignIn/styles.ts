import { StyleSheet } from 'react-native';
import { theme } from '../../global/styles/theme';

export const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: theme.colors.background,
        alignItems: 'center',
        justifyContent: 'center',
    },
    content: {
        marginTop: -40,
        paddingHorizontal: 50,
    },
    image: {
        width: '100%',
        height: 360,
    },
    mainText: {
        textAlign: 'center',
        color: theme.colors.heading,
        fontSize: 40,
        marginBottom: 16,
    },
    secondaryText: {
        textAlign: 'center',
        color: theme.colors.heading,
        fontSize: 15,
        marginBottom: 64,
    },
});